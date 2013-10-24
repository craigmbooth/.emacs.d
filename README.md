craigmbooth's .emacs.d
======================

### Overview

This is my emacs setup.  The package is organized as follows:  The base of the installation is <code>init.el</code>,
which automatically loads the contents of the two subdirectories:

* <code>cmbmacs/</code> My emacs configuration files, broken down by subject
* <code>local/</code> Local files for each machine. Ignored by the git repository

On first run, the code will attempt to automatically install all of the required packages using <code>package.el</code>
and <code>el-get.el</code>.  If you're running Emacs 23, be sure to install <code>package.el</code> to the
<code>local/</code> directory before running for the first time.  No need to install <code>el-get.el</code> as it will
automatically be bootstrapped in by the code on first run.

###Installation

Clone the repository to your home directory

    git clone ssh://git@github.com:craigmbooth/.emacs.d.git ~
    
Install the following support-executables, if they're not already installed

* <code>w3m</code> --- for in-Emacs web-browsing
* <code>git</code> --- in order to automatically bootstrap in <code>el-get.el</code>

###Credits

I have used ideas and fragments of code from a large number of sources in putting together my Emacs configuration.  
Notable sources include:

* [emacs-prelude](https://github.com/bbatsov/prelude) --- Package management techniques
* [better-defaults](https://github.com/technomancy/better-defaults) --- Many sensible changes
* [cjohansen/.emacs.d](https://github.com/cjohansen/.emacs.d) --- Killing screen junk at start of config
* [cndreisbach/.emacs.d](https://github.com/cndreisbach/.emacs.d) --- Markdown mode and some keybindings
* [milkypostman/dotemacs](https://github.com/milkypostman/dotemacs) --- Ideas for abbrev_defs
