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
tools, clones repos, deploys dotfiles and activates mise in zsh.

## Update

```sh
mise bootstrap --update
```

## Uninstall

```sh
mise dotfiles unapply
```

Removes the deployed dotfiles only, not packages or tools.

## Notes

- `~/.zshrc` is copied, not linked, because mise refuses to edit a symlink and it adds its
  activation block there. Edit `zsh/.zshrc` in the repo, then run `mise dotfiles apply`.

### Themes I like

- catppuccin
- everforest dark
