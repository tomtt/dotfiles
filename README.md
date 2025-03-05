## Dotfiles

Automatically install a nerdy env with some cool stuff:

- 🖥️ [Zsh](https://www.zsh.org/)
- 🚀 [Starship](https://starship.rs/)
- 💤 [LazyVim](https://www.lazyvim.org/)
- 🔥 [Tmux](https://github.com/tmux/tmux/wiki)
- 🐈 [Catppuccin](https://github.com/catppuccin/catppuccin)

Also uses [Stow](https://www.gnu.org/software/stow/manual/stow.html) to easy keep track of changes in this dotfiles.

## Screenshots

<img width="1448" alt="Screenshot 2024-04-21 at 11 25 24" src="https://github.com/muromeo1/dotfiles/assets/22664903/b82e0cdf-12ba-46dd-a94f-2b6e9e10830d">

<img width="1452" alt="Screenshot 2024-04-21 at 11 27 45" src="https://github.com/user-attachments/assets/42499274-1fd3-4d6c-b641-b138c3a3ab4e">

## Installation

1 - Install brew

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Note: for linux installations, set the PATH on

```
echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >> ~/.profile

source ~/.bashrc
source ~/.profile
```

2 - Install ZSH

```
brew install zsh
zsh
```

3 - Clone repo

```zsh
git clone https://github.com/muromeo1/dotfiles.git
```

4 - Run install script

```zsh
cd ~/dotfiles/
sh install.sh
```

5 - Close and reopen terminal, or

```zsh
source ~/.zshrc
```

6 - Set JetBrainsNerdFont as the font to terminal

7 - Change terminal color to #181725

#### (Optional)

Configure git

```zsh
sh configure_git.sh
```
