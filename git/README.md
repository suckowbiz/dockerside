# git

Distributed version control system.

## Mounts

- `~/.config/git` to read/write global configuration
- `~/.ssh` to read SSH settings
- `<current working directory>` to mount as git repository

## Run

...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:

### Using public image from Docker registry

- Download and execute: https://raw.githubusercontent.com/suckowbiz/dockerside/master/git/git

### (Build from scratch) 

- `git clone https://github.com/suckowbiz/dockerside.git`
- `docker-compose --file dockerside/docker-compose.yaml build git`.
- `dockerside/git/git`.

## Bash Prompt

Add to `~/.bashrc`:

```bash
function is_git_directory {
  local result=0

  local possible_git_root="$PWD"
  until [[ -e "${possible_git_root}/.git/index" ]] || [[ "${possible_git_root}" = "/" ]]; do
    possible_git_root=$(dirname "${possible_git_root}")
    if [[ "${possible_git_root}" == "/" ]]; then
      result=1
    fi
  done

  return $result
}

function get_git_branch {
  if is_git_directory; then
    local branch=$(git branch 2>/dev/null | grep "\*" 2>/dev/null | sed "s/\*//" | tr --delete --complement "[:alpha:]" | sed "s/^m//" | sed "s/m$//")
    if [[ "${branch}" = "" ]]; then
      return
    fi
    echo "[${branch}] "
  fi
}
export PS1="$PS1\[\033[01;32m\]\$(parse_git_branch)\[\033[00m\]"
```