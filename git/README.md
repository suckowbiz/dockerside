# git

Distributed version control system.

## Mounts

- `~/.config/git` to read/write global configuration
- `~/.ssh` to read SSH settings
- `<current working directory>` to mount as git repository

## Run

...  on an [Ubuntu](http://www.ubuntu.com/download/desktop) machine:

### Using public image from Docker registry

- Download and execute to be able to run `git` from anywhere: 
```bash
sudo curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/git/git > /usr/bin/git && sudo chmod +x /usr/bin/git
```

### (Build from scratch) 

- `git clone https://github.com/suckowbiz/dockerside.git`
- `docker-compose --file dockerside/docker-compose.yaml build git`.
- `dockerside/git/git`.

## Bash Prompt

To add git branch name to your `PS1` prompt add to `~/.bashrc`:

```bash
#######################################
# Returns the git root directory of given directory.
# Globals:
# Arguments:
#   $1 - directory to check from
# Returns:
#   the git root directory or empty string
#######################################
function get_git_root {
  local result="$1" 
  if [[ "${result}" = "/" ]]; then
    echo ""
  elif [[ -e "${result}/.git/index" ]]; then
    echo "${result}"
  else
    get_git_root "$(dirname "${result}")"
  fi
}

#######################################
# Returns the git branch name.
# Globals:
# Arguments:
# Returns:
#   the git branch name or nothing or empty string
#######################################
function get_git_branch {
  local git_root="$(get_git_root "${PWD}")"
  if [[ "${git_root}" = "" ]]; then
    return
  fi
  local branch=$(sed "s/.*heads\///" 2>/dev/null < "${git_root}"/.git/HEAD)
  [[ "${branch}" = "" ]] && echo "" || echo "[${branch}] "
}
export PS1="$PS1\[\033[01;32m\]\$(get_git_branch)\[\033[00m\]"
```