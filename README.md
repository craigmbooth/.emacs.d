.emacs.d
========

This is my emacs setup.  Along with init.el, the setup is organized into three folders:

* packages/ Small packages that I install by hand
* cmbmacs/ My emacs configuration files, broken down by subject
* local/ Local files for each machine. Ignored by the git repository

The packages/ directory currently contains

* guru-mode.el --- Become an Emacs guru (https://github.com/bbatsov/guru-mode)
* hackernews.el --- Hacker News Client for Emacs (lincoln@comum.org)
* highlight-indentation.el --- Minor modes for highlighting indentation (anton.johansson@gmail.com)

Things somewhat work in Emacs 23, but it lacks the package package and I don't make much use of older Emacs any more so have just skipped a lot of this code.  The code will attempt to install everything on a first run using package.  Wish it luck!
