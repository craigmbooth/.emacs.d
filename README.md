craigmbooth's .emacs.d
======================

### Overview

This is my emacs setup.  The package is organized as follows:  The base of the installation is <code>init.el</code>,
which automatically includes the contents of the three subdirectories:

* <code>packages/</code> Small packages that I install by hand
* <code>cmbmacs/</code> My emacs configuration files, broken down by subject
* <code>local/</code> Local files for each machine. Ignored by the git repository

The <code>packages/</code> directory currently contains

* <code>hackernews.el</code> --- Hacker News Client for Emacs (lincoln@comum.org)
* <code>highlight-indentation.el</code> --- Minor modes for highlighting indentation (anton.johansson@gmail.com)

On first run, the code will attempt to automatically install all of the required packages using <code>package.el</code>
and <code>el-get.el</code>.  If you're running Emacs 23, be sure to install <code>package.el</code> to the
<code>local/</code> directory before running for the first time.  No need to install <code>el-get.el</code> as it will
automatically be bootstrapped in by the code on first run.

###Installation

Clone the repository to your home directory

    git clone git@github.com:craigmbooth/.emacs.d.git ~
    
Install the following support-executables, if they're not already installed

* <code>w3m</code> --- for in-Emacs web-browsing
* <code>git</code> --- in order to automatically bootstrap in <code>el-get.el</code>
