# 🍏 MacOS Nix + Home Manager setup by [@lukzmu](https://github.com/lukzmu)

This repository holds code for my Nix + Home Manager configuration for MacOS. This configuration is created for my personal purposes, but you are free to experiment and set up your own environments with it. Some of the features that it brings to the table:

- Complete dev setup with wezterm, neovim, and more,
- MacOS customizations and theming,
- Structure for adding more hosts easily,
- Nix and Homebrew package systems.

![Screenshot](.github/screenshot.png)

## Requirements

- [Lix](https://lix.systems) - *highly recommend this one for MacOS, as it makes life much easier*.

## Activating configurations

To activate a host environment, run the following command in the downloaded repository and replace `<host>` with the host name:

```bash
sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .#<host>
```

To change enabled profile environments for a host, edit the `profiles = [...]` list in `flake.nix`, then run `darwin-rebuild switch` again.

When you add new files to this flake, make sure they are tracked by Git before running `nix` commands. Git-based flakes only see tracked files.

## Development and everyday usage

To ease development you can use `mise` commands.

| Command | Description |
| --- | --- |
| `mise lint` | Lint nix configurations |
| `mise fix` | Fix improper nix configurations |
| `mise run switch <host>` | Build and switch to the selected host configuration |
| `mise purge` | Cleanup old builds |
| `mise prek-install` | Install prek hooks |
| `mise prek-run` | Use prek hooks manually |

Examples: `mise run switch terra` or `mise run switch luna`.

## Existing Configurations

| Host | Machine | Platform | Primary user | Enabled profiles |
| --- | --- | --- | --- | --- |
| `terra` | MacBook Pro | `aarch64-darwin` | `lukzmu`                       | `base`, `ai`, `dev`, `personal`, `gaming` |
| `luna`  | MacBook Air | `aarch64-darwin` | `lukasz.zmudzinski@stxnext.pl` | `base`, `dev`, `work`               |

## Repository Layout (What Is Defined Where)

| Path | What it defines |
| --- | --- |
| `flake.nix` | Main flake entrypoint: inputs, hosts, and enabled profiles. |
| `home.nix` | Home Manager entrypoint for user-level configuration. |
| `hosts/` | Host-specific macOS settings, identities, and overrides. |
| `modules/darwin/` | Shared nix-darwin baseline settings. |
| `modules/apps/` | Package/application definitions (Nix + Homebrew) by profile. |
| `modules/home/profiles/` | Profile definitions used by Home Manager (`base`, `dev`, etc.). |
| `modules/home/programs/` | Program-specific user configs (shell, git, editor, terminal). |
| `modules/home/theme/` | Theme and wallpaper-related configuration. |

## Known issues

- `battle-net` homebrew cask is installed, but only as a standalone setup app. You need to run it to actually install the app. After everything works just fine.

## Attribution

- Awesome wallpaper: *Shadow over Innsmouth* created by [Guillem H. Pongiluppi](https://www.artstation.com/artwork/oZbyJ)
