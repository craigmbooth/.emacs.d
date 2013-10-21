; TODO:
;
; Find that lady's website and get how to put ipython in emacs

(setq load-path (cons "~/.emacs.d/cmbmacs/" load-path))
(setq load-path (cons "~/.emacs.d/packages/" load-path))

(load "cmb-packages.el")    ;package management
(load "cmb-navigation.el")  ;navigating emacs frames and files
(load "cmb-appearance.el")  ;changing how frames look
(load "cmb-python.el")      ;settings for python-mode

(require 'hackernews)
