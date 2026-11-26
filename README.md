# dotfiles

Managed with [mise bootstrap](https://mise.jdx.dev/bootstrap.html). The config lives in
[`mise/.config/mise/config.toml`](mise/.config/mise/config.toml): tools, brew packages, repos
and dotfile groups.

## Install

On a new machine:

```sh
curl https://mise.run | sh
~/.local/bin/mise bootstrap \
  --from https://github.com/ddbas/dotfiles.git \
  --from-dir ~/repos/dotfiles \
  --config-dir mise/.config/mise
```

This clones the repo, links `~/.config/mise` to `mise/.config/mise`, then installs packages and
tools, clones repos and deploys dotfiles. `~/.zshrc` is written by mise (its activation block plus a `source` of `~/.config/zsh/zshrc`). Edit `zsh/.config/zsh/zshrc` in the repo.

## Update

```sh
mise bootstrap --update
```

## Uninstall

```sh
mise dotfiles unapply
```

Removes the deployed dotfiles only, not packages or tools.

### Themes I like

- catppuccin
- everforest dark
