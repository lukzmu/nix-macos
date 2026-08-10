# ❄️ NixOS + Home Manager setup by [@lukzmu](https://github.com/lukzmu)

My personal NixOS + Home Manager configuration. Feel free to take what you like.

- Complete dev setup with ghostty, neovim, and more,
- Desktop built on the Niri scrollable-tiling Wayland compositor with
  [DankMaterialShell](https://danklinux.com), and NVIDIA support,
- Declarative disk layout with LUKS full-disk encryption via disko,
- Profile-based structure for adding more hosts easily.

![Screenshot](.github/screenshot.png)

## Hosts

| Host | Machine | Platform | User | Profiles |
| --- | --- | --- | --- | --- |
| `sol` | Desktop PC | `x86_64-linux` | `lukzmu` | `base`, `dev`, `personal`, `gaming`, `ai`, `desktop` |

## Usage

```bash
sudo nixos-rebuild switch --flake .#sol
```

For kernel or NVIDIA driver changes use `boot` instead of `switch` and reboot. A live
`switch` cannot swap a loaded kernel module, which leaves userspace libGL and the kernel
module on different versions and produces a black or hung session.

To change enabled profiles, edit the `profiles = [...]` list in `flake.nix` and rebuild.
When you add new files, `git add` them first — git-based flakes only see tracked files.

`mise` wraps the everyday commands:

| Command | Description |
| --- | --- |
| `mise lint` | Lint nix configurations |
| `mise fix` | Fix improper nix configurations |
| `mise run switch sol` | Build and switch to the host configuration |
| `mise run boot sol` | Stage the configuration for the next boot |
| `mise run check` | Evaluate the host configuration without building |
| `mise run build` | Build the system closure without activating it |
| `mise purge` | Cleanup old builds |
| `mise prek-install` | Install prek hooks |
| `mise prek-run` | Use prek hooks manually |

### Where the repository must live

`flake.nix` threads a `flakeRoot` path into Home Manager, defaulting to
`~/developer/projects/lukzmu/nix-config`. `~/.config/nvim` is symlinked to the working tree
at that path instead of into the Nix store, so `:Lazy sync` can write `lazy-lock.json`
straight back into the repository and Lua edits apply without a rebuild.

**If your checkout is somewhere else, set `flakeRoot` for that host in `flake.nix`** —
otherwise `~/.config/nvim` will be a dangling symlink and neovim starts unconfigured.

## Repository layout

| Path | What it defines |
| --- | --- |
| `flake.nix` | Main entrypoint: inputs, hosts, enabled profiles, and `flakeRoot`. |
| `home.nix` | Home Manager entrypoint for user-level configuration. |
| `hosts/` | Host-specific settings, identities, disk layout, and overrides. |
| `modules/nixos/` | Shared NixOS baseline: system, NVIDIA, and the Niri desktop. |
| `modules/apps/` | Package/application definitions by platform and profile. |
| `modules/home/profiles/` | Profile definitions used by Home Manager (`base`, `dev`, etc.). |
| `modules/home/programs/` | Program-specific user configs (shell, git, editor, terminal). |
| `modules/home/programs/desktop/` | Niri compositor configuration (`config.kdl`). |

