;;;Repositories for emacs packages
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(require 'package)
(require 'cl)

;;; Packages to be installed by package
(defvar cmb-packages
  '(zenburn-theme
    python-mode
    pymacs
    typing
    auctex
    auto-dim-other-buffers
    pretty-lambdada
    diminish
    w3m
    hackernews
    guru-mode
    highlight-indentation
    markdown-mode
    zoom-frm
    ace-jump-mode
    yasnippet
    autopair
    ein
    )
  "Ensure all the following packages are installed via package manager.")

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)


(defun cmb-packages-installed-p ()
  (loop for p in cmb-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

;;Loop over packages and if one is not found, install it:
(unless (cmb-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p cmb-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'cmb-packages)
