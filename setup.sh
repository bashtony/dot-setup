#!/bin/bash

cd "$HOME"

sudo apt update -y
sudo apt upgrade -y

# Instalação do VIM e dependências
if [ -d "$HOME/.vim" ]; then
    echo "VIM já está instalado. Verificando se há atualizações..."
    sudo apt update -y
    sudo apt upgrade -y vim 
else
    sudo apt install -y vim clang make libtool-bin
fi

# Instalação do VIM-Plug
if [ -f "$HOME/.vim/autoload/plug.vim" ]; then
  echo "Vim-plug já está instalado."
else
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  rm -rf "$HOME/vim"
fi


# Instalação do Node.js e nvm

if [ -d "$HOME/.nvm" ]; then
  echo "Node.js e NVIM já estão instalados."
else
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
  [ -s "$HOME/.nvm/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"
  nvm install --lts
  nvm alias default 'lts/*'
fi

# Clonagem dos dotfiles
REPO_DIR="./.dotfiles"
FONTE_DIR="$HOME/.local/share/fonts"

if [ -d "$REPO_DIR" ]; then
  echo "Os dotfiles já existem."
else
  git clone https://github.com/bashtony/dotfiles.git "$REPO_DIR"
  cd "$REPO_DIR"; mv * .[^.]* ../; cd "$HOME"

  # Movendo os arquivos (coc-json)
  if [ -f "coc-settings.json" ]; then
    mv coc-settings.json "$HOME/.vim"
  else
    echo "COC já está configurado."
  fi

  # Movendo os arquivos (.ttf)
  if [ ! -d "$FONTE_DIR" ]; then
    mkdir -p "$FONTE_DIR"
    mv "$HOME/HackNerdFontMono-Regular.ttf" "$FONTE_DIR"
    echo "Fonte movida com sucesso."
  else
    mv "$HOME/HackNerdFontMono-Regular.ttf" "$FONTE_DIR"
  fi
fi

# Ajustes finais
vim -es -u "$HOME/.vimrc" -c "PlugInstall" -c "qa"
rm -rf "$HOME/vim"
fc-cache -fv &> /dev/null
