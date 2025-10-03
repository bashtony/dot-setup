# ⚙️ dot_setup

Bem-vindo ao meu repositório de arquivos de configuração (dotfiles) e ao script de instalação automatizada. Este repositório garante um ambiente de desenvolvimento Linux (Debian/Ubuntu) consistente com Vim (compilado do código-fonte), Vim-Plug, CoC (com Node.js/NVM) e Hack Nerd Font.
🚀 Instalação Rápida

Para utilizar, certifique-se de que você está no seu diretório `$HOME` e clone este repositório lá:

```bash
git clone https://github.com/bashtony/dot-setup.git
```
Após isso, entre na pasta do repositório e dê permissão para executá-lo, através do chmod, e depois execute-o:
```shell
chmod a+x ./setup.sh
bash ./setup.sh
```
## 💻 O que o script faz automaticamente:
  - Atualiza o sistema (`apt`).
  - Instala dependências como `tmux`, `git`, `curl` e `build-essential`.
  - Compila e instala o Vim a partir do código fonte mais recente.
  - Instala o gerenciador de versões NVM e o Node.js LTS (necessário para o CoC).
  - Instala o Vim-Plug.
  - Na primeira execução: Move todos os dotfiles (`.vimrc`, `.tmux.conf`, etc.), configura o `coc-settings.json` e instala a Hack Nerd Font.
  - Roda o comando `vim -c "PlugInstall"` para instalar todos os plugins do Vim.

## 📂 Arquivos de Configuração Principais
- ``.vimrc``: possui as configurações do VIM, incluindo a chamada do VIM-Plug e plugins essenciais.
- ``.tmux.conf``: status line do tmux personalizada.
- ``.ide.sh``: configura um projeto novo em ReactJS. Para abrir um existente, apenas escreva o nome exato dele.
- Arquivo da fonte que é movido para `~/.local/share/fonts/`.

## 🔄 Atualizando os Dotfiles

Se você rodar o script novamente, ele ignorará a instalação inicial do Node/Fonte e fará apenas a manutenção:

    Atualização de pacotes do sistema (`apt`).

    Atualização da instalação do Vim/Vim-Plug.

    Executará o `PlugInstall` para instalar quaisquer novos plugins ou atualizações.

Para atualizar (puxar as novas configurações do GitHub) e re-instalar os plugins:

```bash
bash setup.sh
```
🛠️ Notas de Configuração Pós-Instalação

    Fonte: Após a instalação, você pode precisar fechar e abrir seu terminal (ou fazer logoff/login) para que a Hack Nerd Font apareça corretamente nas configurações do seu terminal.

    Plugins CoC: O Node.js está instalado. Se o CoC não iniciar imediatamente, abra o Vim e execute: `:CocInstall coc-json coc-css coc-tsserver`.
