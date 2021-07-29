<h1 align="center">
Neon
</h1>
<h2 align="center">
The Ultimate Theme 🪐
</h2>

### Default

![2021-May-22_2](https://user-images.githubusercontent.com/67771985/119240962-e9d1ab80-bb42-11eb-9d25-37f2b6e9362a.png)

### Doom

![2021-May-22_1](https://user-images.githubusercontent.com/67771985/119240973-f7873100-bb42-11eb-946a-5a824f54f6fb.png)

### Dark

![2021-May-22_3](https://user-images.githubusercontent.com/67771985/119240994-12f23c00-bb43-11eb-96f3-3f9c1e1644a8.png)


### Light

![2021-May-22_4](https://user-images.githubusercontent.com/67771985/119241001-17b6f000-bb43-11eb-94c8-ef43c4f65d1f.png)

## ✨ Features

- Customizable.
- Made to work with [treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
- Support for built-in LSP.
- Support for some of the most popular plugins.
- Soft contrast for eye protection.
- Multiple options to enable italic and bold text.
- Vivid colors.

## Requirements

- [Neovim](https://github.com/neovim/neovim) >= 5.0

> NOTE: doesn't support [Vim](https://github.com/vim/vim), it uses lua.

## 📦 Installation

Use your favorite plugin manager. Example [packer](https://github.com/wbthomason/packer.nvim):

```lua
use "rafamadriz/neon"
```

## 🚀 Usage

##### Neovim

To set the theme you can use the following.

```lua
vim.cmd[[colorscheme neon]]
```

**To see all the available options do** `:help neon-configuration` in Neovim

##### Lualine

To enable the [lualine](https://github.com/hoob3rt/lualine.nvim) theme, put this somewhere in your config:

```lua
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'neon'
    -- ... your lualine config
  }
}
```

## ⚙️ Configuration:

> Note: the configuration options should be placed before `vim.cmd[[colorscheme neon]]`

> To see all the options from neovim, you can execute `:help neon.txt`

| Option                 | Default   | Description                                                                                                                                           |
| ---------------------- | --------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `neon_style`           | "default" | There's three options to choose from, `default`, `doom`, `dark` and `light`                                                                                   |
| `neon_italic_comment`  | true      | Italic text for comments                                                                                                                              |
| `neon_italic_keyword`  | false     | Applies to conditionals and keywords like `for`, `do`, `while`, `loops` etc.                                                                          |
| `neon_italic_boolean ` | false     | `true` and `false`                                                                                                                                    |
| `neon_italic_function` | false     | Applies to function (calls and definitions), method (calls and definitions) and built-in functions.                                                   |
| `neon_italic_variable` | false     | Applies to variable names that are defined by the languages, like `this` or `self`. And any variable name that does not have another highlight group. |
| `neon_bold`            | false     | Applies to error and warning messages, functions (calls and definitions), lsp virtual text, etc.                                                      |
| `neon_transparent`     | false     | Applies no background color to certain highlight groups.                                                                                      |

#### Example config:

```lua
vim.g.neon_style = "default"
vim.g.neon_italic_keyword = true
vim.g.neon_italic_function = true
vim.g.neon_transparent = true

vim.cmd[[colorscheme neon]]
```

## FAQ

It doesn't work as expected.

1. This color scheme is mainly designed for true colors, make sure of setting:
   `vim.o.termguicolors = true`

2. To test if your terminal supports true colors, use the following [script](https://gist.github.com/XVilka/8346728).

3. This colorscheme is made to look good with treesitter, if you don't have it, it won't look the same as the screenshoots.

### How to enable cursive italic keywords?

1. Install a font that supports italics, for example
   [JetBrains-NerdFont](https://www.nerdfonts.com/font-downloads) is an
   excellent font.

2. Set the correct italic font for your terminal of choice.

3. Enable italic text. E.g. `vim.g.neon_italic_keyword = true`

### Supported plugins:

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim)
- [nvim-bufferline](https://github.com/akinsho/nvim-bufferline.lua)
- [neogit](https://github.com/TimUntersberger/neogit)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- [vim-signify](https://github.com/mhinz/vim-signify)
- [vim-syntastic](https://github.com/vim-syntastic/syntastic)
- [nerdtree](https://github.com/preservim/nerdtree)
- [ale](https://github.com/dense-analysis/ale)
- [vim-sneak](https://github.com/justinmk/vim-sneak)
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [vim-startify](https://github.com/mhinz/vim-startify)
- [vim-easymotion](https://github.com/easymotion/vim-easymotion)
- [coc.nvim](https://github.com/neoclide/coc.nvim)

## TODO

- Add transparent option.
- Add support for terminals (kitty, alacritty, etc.)

## Acknowledgments

Inspired by [Doom One](https://github.com/hlissner/emacs-doom-themes) and [Edge](https://github.com/sainnhe/edge)
