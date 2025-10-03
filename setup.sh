#!/bin/bash

cd "$HOME"

sudo apt update
sudo apt upgrade
sudo apt install -y tmux git curl

# Instalação do VIM e dependências.
if vim --version; then
    echo "VIM Já está instalado."
else
    sudo apt install -y clang make libtool-bin
    git clone https://github.com/vim/vim.git
    cd ./vim/src
    make
    sudo make install
    cd "$HOME"
fi

# Instalação do VIM-Plug
if [ -f "$HOME/.vim/autoload/plug.vim" ]; then
  echo "Vim-plug já está instalado."
else
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


# Instalação do Node.js e nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
[ -s "$HOME/.nvm/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"
nvm install --lts
nvm alias default 'lts/*'

# Clonagem dos dotfiles
REPO_DIR="./dotfiles"
FONTE_DIR="$HOME/.local/share/fonts"

if [ -d "$REPO_DIR" ]; then
  echo "Os dotfiles já existem."
else
  git clone https://github.com/bashtony/dotfiles.git "$REPO_DIR"
  cd "$REPO_DIR"; mv * .[^.]* ../; cd "$HOME"
  rm -rf "$REPO_DIR"
  
  # Movendo os arquivos (coc-json)
  if [ -f "coc-settings.json" ]; then
    mv coc-settings.json "$HOME/.vim"
  else
    echo "COC já está configurado."
  fi

  # Movendo os arquivos (fonte)
  mkdir -p "$FONTE_DIR"
  if [ -f "$HOME/HackNerdFontMono-Regular.ttf" ]; then
   mv "$HOME/HackNerdFontMono-Regular.ttf" "$FONTE_DIR"
   fc-cache -fv
  else
    echo "Fonte não encontrada. Não foi possível movê-la ao destino."
  fi
fi
vim -es -u "$HOME/.vimrc" -c "PlugInstall" -c "qa" 
