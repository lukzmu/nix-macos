![GitHub License](https://img.shields.io/github/license/lukzmu/.dotfiles)
![Static Badge](https://img.shields.io/badge/system-MacOS-blue)

# 🍏 MacOS Nix + Home Manager configuration by [@lukzmu](https://github.com/lukzmu)

This repository holds code for my Nix + Home Manager configuration for MacOS. This configuration is created for my personal purposes, but you are free to experiment and set up your own environments with it. Some of the features that it brings to the table:

- Complete dev setup with wezterm, neovim, and more,
- MacOS customizations and theming,
- Structure for adding more hosts easily,
- Nix and Homebrew package systems.

![Screenshot](.github/screenshot.png)

## Requirements

- [Lix](https://lix.systems) - *highly recommend this one for MacOS, as it makes life much easier*.

## Activating configurations

To activate the `terra` environment simply run the following command in the downloaded repository:

```bash
sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .#terra
```

To change enabled profile environments for a host, edit the `profiles = [...]` list in `flake.nix`, then run `darwin-rebuild switch` again.

## Existing Configurations

| Host | Machine | Platform | Primary user | Enabled profiles |
| --- | --- | --- | --- | --- |
| `terra` | MacBook Pro (main) | `aarch64-darwin` | `lukzmu` | `base`, `dev`, `desktop`, `gaming` |

## Repository Layout (What Is Defined Where)

| Path | What it defines |
| --- | --- |
| `flake.nix` | Main flake entrypoint: inputs, hosts, and enabled profiles. |
| `home.nix` | Home Manager entrypoint for user-level configuration. |
| `modules/darwin/` | System-level macOS and Nix Darwin settings. |
| `modules/apps/` | Package/application definitions (Nix + Homebrew) by profile. |
| `modules/home/profiles/` | Profile definitions used by Home Manager (`base`, `dev`, etc.). |
| `modules/home/programs/` | Program-specific user configs (shell, git, editor, terminal). |
| `modules/home/theme/` | Theme and wallpaper-related configuration. |

## Attribution

- Awesome wallpaper: *Shadow over Innsmouth* created by [Guillem H. Pongiluppi](https://www.artstation.com/artwork/oZbyJ)
