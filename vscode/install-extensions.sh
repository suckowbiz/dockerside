#!/usr/bin/env bash
#
# Intentionally added to install extensions in a run.

#######################################
# Install extension and waits for completion.
# Globals:
#   None
# Arguments:
#   $1 - name of extension
# Returns:
#   None
#######################################
install_extension () {
    echo "Installing ${1}.."
    code --install-extension "${1}" 1>/dev/null
    until [ ! "$(docker ps |grep code 1>/dev/null; echo $?)" = 0 ]; do
        sleep 1s
    done;
    echo "Done."
}

# Ansible, YAML
install_extension timonwong.ansible-autocomplete
install_extension wholroyd.jinja
install_extension haaaad.ansible
install_extension djabraham.vscode-yaml-validation
install_extension tht13.python

# Markdown
install_extension DavidAnson.vscode-markdownlint
install_extension hnw.vscode-auto-open-markdown-preview

# Docker
install_extension PeterJausovec.vscode-docker
install_extension henriiik.docker-linter

# Bash
install_extension timonwong.shellcheck

# Git
install_extension eamodio.gitlens
install_extension donjayamanne.githistory

# Look & feel
install_extension SolarLiner.linux-themes
install_extension PKief.material-icon-theme
install_extension k--kato.intellij-idea-keybindings

# Other
install_extension abusaidm.html-snippets

code
