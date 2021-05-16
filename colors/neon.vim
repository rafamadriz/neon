" clear cache so this reloads changes.
" useful for development
lua package.loaded['neon'] = nil
lua package.loaded['neon.colors'] = nil
lua package.loaded['neon.utils'] = nil
lua package.loaded['neon.config'] = nil
lua require('neon').colorscheme()
