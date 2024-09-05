# My Dotfiles

These are all my configuration files for macOS.

## Setup

**THIS SECTION IS STILL A WORK IN PROGRESS.**

First, start by installing all of the following:

1. Install [Homebrew](https://brew.sh/)
2. Install [iTerm2](https://iterm2.com/) ([via Homebrew](https://formulae.brew.sh/cask/iterm2))
3. Install [Neovim](https://neovim.io/) ([via Homebrew](https://formulae.brew.sh/formula/neovim))
4. Install [Stow](https://formulae.brew.sh/formula/stow) ([via Homebrew](https://formulae.brew.sh/formula/stow))
5. Install [Oh My Zsh](https://ohmyz.sh/)
6. Install [Oh My Posh](https://ohmyposh.dev/) ([via Homebrew](https://formulae.brew.sh/formula/oh-my-posh))
7. Install [Zellij](https://zellij.dev/) ([via Homebrew](https://formulae.brew.sh/formula/zellij))

### Setup iTerm2

## Note on directory structure for use with `stow`

From the [GNU Stow website](https://www.gnu.org/software/stow/):
> GNU Stow is a symlink farm manager which takes distinct packages of software and/or data located in separate directories on the filesystem, and makes them appear to be installed in the same place. This is particularly useful for keeping track of system-wide and per-user installations of software built from source, but can also facilitate a more controlled approach to management of configuration files in the user's home directory, especially when coupled with version control systems.

The directories that are used by `stow` in this repo are:
- `nvim/`
- `oh-my-posh/`
- `zsh/`

Everything in the above directories must be setup exactly how you want it to be symlinked by `stow` into your home directory.

For example, we have this:

```bash
dotfiles
└── zsh/
    └── .zshrc
```

When we use `stow --target=$HOME zsh`, `stow` will create the following symlink:

```bash
~
└──.zshrc -> Development/dotfiles/zsh/.zshrc
```

Since the `.zshrc` file needs to be directly in our home folder, we put it at the top level of it's folder for when we run the `stow` command. You can think of each directory in this project as a "home" folder but just for the project it contains.

As another example, you will see that the `nvim` folder looks like this:

```bash
dotfiles
└── nvim
    └── .config
        └── nvim
```

This is because we want our `nvim` config folder to end up in `~/.config/nvim`. Like before, we can basically pretend that `nvim` is our home folder, and everything in it should be relative to where it should be in the home folder. So again, when we use the `stow --target=$HOME nvim` we will end up with this which is the correct structure for Neovim to use our configuration:

```bash
~
└── .config
    ├── gcloud
    ├── iterm2
    └── nvim -> ../Development/dotfiles/nvim/.config/nvim
```
