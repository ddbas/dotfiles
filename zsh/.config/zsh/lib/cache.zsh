#!/bin/zsh
# Cache a tool's init output and source it.
# Refreshes if the cache is missing, older than 24h, or the binary is newer.
# usage: _cache_init <name> <cmd...>
_cache_init() {
  local name=$1; shift
  local bin=${commands[$1]:-$1}
  local f=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/$name.zsh
  local -a stale=($f(N.mh+24))
  [[ -x $bin ]] || return
  if [[ ! -s $f || $#stale -gt 0 || $bin -nt $f ]]; then
    mkdir -p ${f:h} && "$@" >| $f.tmp 2>/dev/null && mv -f $f.tmp $f
  fi
  [[ -s $f ]] && source $f
}
