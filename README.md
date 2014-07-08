vim-less
========

![vim-less syntax highlighting](https://github.com/genoma/vim-less/raw/master/vim.png)

Tim Pope [vim-haml](http://www.vim.org/scripts/script.php?script_id=1433) fork to highlight Less syntax correctly (mostly).

This is a very rough modification of Tim syntax files to highlight Less syntax.

# Installing

Using [Vundle](https://github.com/gmarik/vundle), add this to your `.vimrc` file:

`Bundle 'genoma/vim-less'`

Using [Pathogen](https://github.com/tpope/vim-pathogen) clone this repository in `'~/.vim/bundle'`:

`$ cd ~/.vim/bundle`
`$ git clone https://github.com/genoma/vim-less.git`

# Dependencies

You can enable support to CSS3 improved syntax highlighting installing [vim-css3-syntax](https://github.com/hail2u/vim-css3-syntax)

# Contributing

There are a bunch of issues right now that need attention:

- [x] ~~`@media` queries are identified as less variables~~
- [x] ~~`div { font-size: 20px; }` written on one line, is identified as `cssDeprecated`~~ (fixed with a temporary workaround)
- [x] ~~The code is in need of some cleaning~~

If you find yourself having some free time on your hands and want to contribute, i strongly encurage you to do so.

# License

The MIT License (MIT)

Copyright (c) 2014 Alessandro Vioni

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
