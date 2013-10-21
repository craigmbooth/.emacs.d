(message "Starting up with emacs version %s" emacs-version)

;;Hide menu bar, tool bar and scroll bar
;;Do this early on in the startup procedure to avoid having
;;these elements flash on then off.
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;;Third-party packages I have installed
(add-to-list 'load-path "~/.emacs.d/packages/")
(add-to-list 'load-path "~/.emacs.d/cmbmacs/")

;Macros for navigating emacs frames and files
(load "cmb-navigation.el")

;Things for editing plaintext
(load "cmb-textedit.el")

;;If version is 24+ then load everything
;;(This is a bit lazy, but the package package is only default
;; in major version 24+
(when (>= emacs-major-version 24)
  (load "cmb-packages.el")    ;package management
  (load "cmb-appearance.el")  ;changing how frames look
  (load "cmb-python.el")      ;settings for python-mode
)

;;Various packages that I just always switch on
(require 'hackernews)
