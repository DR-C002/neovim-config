# ⚡ Neovim Configuration

A modern, lightweight, and developer-focused **Neovim configuration** built around `lazy.nvim`.

Designed for a fast and comfortable workflow with a focus on **C development, Lua, Bash, Git, file navigation, LSP, autocompletion, and terminal integration**.

> ✨ Transparent UI · TokyoNight · LSP · Treesitter · Telescope · NvimTree · Completion · Terminal

---

## 📸 Features

* 🎨 Transparent **TokyoNight** theme
* 🌳 **NvimTree** file explorer
* 🔎 **Telescope** fuzzy finder and live grep
* 🧠 **LSP** support with Mason
* ⚡ **nvim-cmp** autocompletion
* 🌲 **Treesitter** syntax highlighting
* 📑 **Bufferline** for buffer navigation
* 📊 **Lualine** status bar
* 💻 **ToggleTerm** integrated terminal
* 🚀 **Alpha** dashboard
* 📋 System clipboard integration
* ⌨️ Custom keyboard-driven workflow
* 🔧 Automatic installation of required LSP servers

---

## 🧰 Requirements

Make sure the following are installed before using this configuration:

* [Neovim](https://neovim.io/)
* Git
* A Nerd Font for icons
* A C compiler such as GCC or Clang
* `ripgrep` for Telescope live grep
* A working terminal

For C development, this configuration uses **clangd** through Mason.

---

## 📦 Installation

Clone the repository into your Neovim configuration directory:

```bash
git clone git@github.com:DR-C002/neovim-config.git ~/.config/nvim
```

Then start Neovim:

```bash
nvim
```

`lazy.nvim` will automatically install the configured plugins.

Restart Neovim after the initial installation if necessary.

---

## 🧩 Plugin Stack

### Plugin Manager

* `lazy.nvim`

### UI & Appearance

* `tokyonight.nvim`
* `alpha-nvim`
* `lualine.nvim`
* `bufferline.nvim`
* `nvim-web-devicons`

### Navigation

* `nvim-tree.lua`
* `telescope.nvim`
* `plenary.nvim`

### Completion

* `nvim-cmp`
* `cmp-nvim-lsp`
* `cmp-buffer`
* `cmp-path`
* `LuaSnip`
* `cmp_luasnip`

### LSP

* `nvim-lspconfig`
* `mason.nvim`
* `mason-lspconfig.nvim`

Configured language servers:

* `clangd`
* `bashls`

### Syntax Highlighting

* `nvim-treesitter`

Configured languages include:

* C
* Lua
* Vim
* Vimdoc
* Bash
* Dockerfile
* JSON

### Terminal

* `toggleterm.nvim`

---

## ⌨️ Keybindings

The main leader key is:

```text
Space
```

### 🪟 Window Management

| Key         | Action               |
| ----------- | -------------------- |
| `Space + v` | Vertical split       |
| `Space + s` | Horizontal split     |
| `Ctrl + h`  | Move left            |
| `Ctrl + j`  | Move down            |
| `Ctrl + k`  | Move up              |
| `Ctrl + l`  | Move right           |
| `Q`         | Close current window |

### 📑 Buffers

| Key         | Action               |
| ----------- | -------------------- |
| `H`         | Previous buffer      |
| `L`         | Next buffer          |
| `Space + x` | Close current buffer |

### 🌳 File Explorer

| Key           | Action             |
| ------------- | ------------------ |
| `Space + f`   | Toggle NvimTree    |
| `a`           | Create file/folder |
| `d`           | Delete             |
| `r`           | Rename             |
| `x`           | Cut                |
| `c`           | Copy               |
| `p`           | Paste              |
| `Enter` / `o` | Open               |

### 🔎 Telescope

| Key         | Action           |
| ----------- | ---------------- |
| `Space + e` | Find files       |
| `Space + w` | Search text      |
| `Ctrl + p`  | Search Git files |

Inside Telescope:

| Key                 | Action           |
| ------------------- | ---------------- |
| `Ctrl + j` / `Down` | Move down        |
| `Ctrl + k` / `Up`   | Move up          |
| `Enter`             | Open             |
| `Ctrl + v`          | Vertical split   |
| `Ctrl + x`          | Horizontal split |
| `Ctrl + t`          | New tab          |
| `Esc` / `Ctrl + c`  | Close            |

### 💻 Terminal

```text
Space + t
```

Toggle the integrated terminal.

### ⚡ Completion

| Key            | Action                           |
| -------------- | -------------------------------- |
| `Tab`          | Next completion / expand snippet |
| `Enter`        | Confirm completion               |
| `Ctrl + Space` | Trigger completion               |
| `Ctrl + f`     | Scroll documentation down        |
| `Ctrl + b`     | Scroll documentation up          |

---

## 🎨 Theme

The configuration uses **TokyoNight Night** with transparency enabled.

The interface also uses custom red, yellow, pink, purple, blue, and orange highlights for different syntax elements and UI components.

The Lualine status bar uses a custom red/yellow theme.

---

## 📁 Configuration Structure

```text
~/.config/nvim/
├── init.lua
├── lazy-lock.json
└── nvim_shortcuts.txt
```

### `init.lua`

Main configuration file containing:

* Neovim options
* Plugin setup
* Keybindings
* Theme configuration
* LSP configuration
* Completion
* Treesitter
* Terminal
* UI customization

### `lazy-lock.json`

Locks plugin versions to specific commits for reproducible installations.

---

## 🔄 Updating Plugins

Open Neovim and run:

```vim
:Lazy
```

Then use:

```vim
U
```

to update plugins.

You can also run:

```vim
:Lazy sync
```

to install, update, and clean plugins.

---

## 🐛 Troubleshooting

### Plugins are not installing

Check that Git is installed:

```bash
git --version
```

Then open:

```bash
nvim
```

and run:

```vim
:Lazy
```

### LSP is not working

Check the installed servers:

```vim
:Mason
```

Make sure `clangd` or `bashls` is installed.

### Treesitter errors

Run:

```vim
:TSUpdate
```

Then restart Neovim.

---

## 📋 Current Plugin Lock

Plugin versions are tracked in `lazy-lock.json`, making the configuration more reproducible across machines. The lockfile currently tracks plugins including `lazy.nvim`, `nvim-cmp`, `nvim-lspconfig`, `nvim-tree`, `nvim-treesitter`, `telescope.nvim`, `toggleterm.nvim`, and `tokyonight.nvim`.

---

## 🚀 Philosophy

This configuration is built around a simple idea:

> **Stay inside Neovim as much as possible.**

The workflow combines:

```text
File Explorer
      ↓
Telescope
      ↓
LSP + Completion
      ↓
Treesitter
      ↓
Integrated Terminal
      ↓
Git
```

Everything is designed to be accessible from the keyboard without constantly switching applications.

---

## 📚 Shortcuts Cheat Sheet

A complete shortcut reference is available in:

```text
nvim_shortcuts.txt
```

The main workflow includes window navigation, buffer management, file exploration, Telescope, terminal access, and completion.

---

## 📄 License

This configuration is provided for personal use and learning.

Feel free to fork it, modify it, and build your own Neovim workflow.

---

⭐ If you find this configuration useful, consider giving the repository a star.

