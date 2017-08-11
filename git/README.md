# git

Distributed version control system.

## Volumes

- `~/.config/git` to persist global configuration.
- `~/.ssh` to provide SSH settings.
- `<current working directory>` to mount as git repository.

## Run

Download run script to have `git` available:

```bash
curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/git/git > /var/tmp/git && sudo mv /var/tmp/git /usr/local/bin/ && sudo chmod +x /usr/local/bin/git
```

## Usage Example

```bash
git --version
```

## (optional) Bash Prompt

Example:

```bash
tobias@T430s:~/Workspace/Docker/github.com/suckowbiz/dockerside$ [master]
```

To add git branch name to your `PS1` prompt add to end of `~/.bashrc`:

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
