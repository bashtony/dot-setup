<img width="754" height="481" alt="Screenshot from 2025-10-04 12-41-57" src="https://github.com/user-attachments/assets/9597fc29-84d2-4a50-8584-7e65540610c9" />
<img width="754" height="481" alt="Screenshot from 2025-10-04 12-47-02" src="https://github.com/user-attachments/assets/fcbb7884-2eab-4548-a9eb-4be2476c9ae4" />

>[!NOTE]
> **Aviso:** Este é um script que eu uso e se adequa bem ao MEU USO, **não use meus dotfiles às cegas**, a menos que saiba o que isso implica. Use por sua conta e risco!

# ⚙️ dot-setup

Bem-vindo ao meu repositório de arquivos de configuração (dotfiles) e ao script de instalação automatizada. Este repositório garante um ambiente de desenvolvimento Linux (Debian/Ubuntu) consistente com Vim, Vim-Plug, CoC (com Node.js/NVM) e Hack Nerd Font.

## 🚀 Instalação Rápida

Para utilizar, certifique-se de que você está no seu diretório `$HOME` e clone este repositório lá:

```bash
git clone https://github.com/bashtony/dot-setup.git
```
Após isso, entre na pasta do repositório e execute o `setup.sh`:
```shell
bash setup.sh
```
## 💻 O que o script faz automaticamente:
  - Atualiza o sistema (`apt`).
  - Instala ferramentas como `tmux`, `git` e `curl`.
  - Instala o gerenciador de versões NVM e o Node.js LTS (necessário para o CoC).
  - Instala o Vim-Plug e plugins que eu julgo essenciais.
  - Na primeira execução: Move todos os dotfiles (`.vimrc`, `.tmux.conf`, etc.), configura o `coc-settings.json` e instala a Hack Nerd Font.
  - Roda o comando `vim -c "PlugInstall"` para instalar todos os plugins do Vim.

## 📂 Arquivos de Configuração Principais
- ``.vimrc``: possui as configurações do VIM, incluindo a chamada do VIM-Plug e plugins essenciais.
- ``.tmux.conf``: status line do tmux personalizada.
- ``.ide.sh``: configura um projeto novo em ReactJS. Para abrir um existente, apenas escreva o nome exato dele.
- Arquivo da fonte que é movido para `~/.local/share/fonts/`.

## 🔧 Plugins do VIM
- `Plug 'sheerun/vim-polyglot'`: adiciona destaques da sintaxe, de acordo com o tema atual.
- `Plug 'vim-airline/vim-airline'` e `Plug 'vim-airline/vim-airline-themes'`: adiciona uma statusline personalizada ao VIM.
- `Plug 'neoclide/coc.nvim', {'branch': 'release}`: adiciona recomendações de código e autocomplete.

## 🤖 `.ide.sh`: Projeto ReactJS com TailwindCSS já configurado

No diretório `$HOME` do seu sistema, digite:
`bash .ide.sh`. Isso abrirá o configurador do projeto.
Digite o nome do diretório no qual quer armazenar o projeto e dê Enter. Para abri-lo novamente mais tarde, faça o mesmo passo-a-passo.

## 🔄 Atualizando os Dotfiles
As atualizações vêm dos dotfiles do meu GitHub.
Para atualizar (puxar as novas configurações do GitHub) e re-instalar os plugins:

```bash
bash setup.sh
```

Se você rodar o script novamente, ele ignorará a instalação inicial do Node/Fonte e fará apenas a manutenção:

```
- Atualização de pacotes do sistema (`apt`).
- Atualização da instalação do Vim/Vim-Plug.
- Executará o `PlugInstall` para instalar quaisquer novos plugins ou atualizações.
```

>[!NOTE]
>### 🛠️ Notas de Configuração Pós-Instalação
> - Fonte: Após a instalação, você pode precisar fechar e abrir seu terminal (ou fazer logoff/login) para que a Hack Nerd Font apareça corretamente nas configurações do seu terminal.
> - Plugins CoC: O Node.js está instalado. Se o CoC não iniciar imediatamente, abra o Vim e execute: `:CocInstall coc-json coc-css coc-tsserver`.
