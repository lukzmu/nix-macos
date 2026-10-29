{
  lib,
  flakeRoot,
  userHome,
  profiles,
  ...
}: {
  warnings = lib.optional (!lib.elem "dev" profiles) "podman/podman-compose come from the 'dev' profile, but the searxng launchd agent is enabled without it";

  launchd.user.agents.podman-searxng = {
    # launchd's default PATH is minimal; podman/podman-compose come from Homebrew.
    path = [
      "/opt/homebrew/bin"
      "/usr/bin"
      "/bin"
      "/usr/sbin"
      "/sbin"
    ];

    # Watchdog that keeps the podman machine and the searxng container running.
    script = ''
      SEARXNG_DIR="${flakeRoot}/containers/searxng"

      log() {
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] searxng: $*"
      }

      # The podman engine is only reachable while the machine is running;
      # make sure it exists and is up.
      ensure_machine() {
        podman info >/dev/null 2>&1 && return 0
        if [ -z "$(podman machine list --format '{{.Name}}' 2>/dev/null)" ]; then
          log "no podman machine found; running 'podman machine init'"
          podman machine init -q || return 1
        fi
        log "podman machine is not running; starting it"
        podman machine start -q || {
          log "podman machine start failed (if stuck: podman machine reset -f podman-machine-default)"
          return 1
        }
      }

      while :; do
        # Homebrew packages may not be installed yet.
        command -v podman >/dev/null 2>&1 || {
          log "podman not installed yet; retrying in 60s"
          sleep 60
          continue
        }

        if ensure_machine; then
          # podman ps lists running containers only; 'up -d' is idempotent.
          podman ps --format '{{.Names}}' | grep -qx searxng || {
            log "searxng is not running; starting it"
            (cd "$SEARXNG_DIR" && podman-compose up -d)
          }
        fi

        sleep 30
      done
    '';

    serviceConfig = {
      # A per-user podman machine cannot run before login, so this is the earliest start.
      RunAtLoad = true;
      KeepAlive = true;
      # CRITICAL: 'podman machine start' spawns the VM in this job's process group;
      # without this, launchd kills the VM right after it starts.
      AbandonProcessGroup = true;
      StandardOutPath = "${userHome}/Library/Logs/searxng.log";
      StandardErrorPath = "${userHome}/Library/Logs/searxng.log";
    };
  };
}
