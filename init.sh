#!/usr/bin/env bash

echo "Début de l'installation"
#Vérifie si Homebrew est déjà installé
if test ! $(which brew); then
    echo "Installing homebrew…"
    export HOMEBREW_BREW_GIT_REMOTE="..."  # put your Git mirror of Homebrew/brew here
    export HOMEBREW_CORE_GIT_REMOTE="..."  # put your Git mirror of Homebrew/homebrew-core here
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update
brew tap "homebrew/bundle"

echo "Installation des apps…"
brew bundle install

sh init_conf_macOs.sh
sh install_fonts.sh

echo "Nettoyage…"
brew cleanup

echo "Mise à jour automatique des brews"
brew autoupdate start --upgrade --greedy --cleanup

echo "Installation terminée"
