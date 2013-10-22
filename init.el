(when (< emacs-major-version 24) 
  (error "cmbmacs startup files require version 24+")
)
(message "Starting up with emacs version %s" emacs-version)

(add-to-list 'load-path "~/.emacs.d/packages/")
(add-to-list 'load-path "~/.emacs.d/cmbmacs/")
(add-to-list 'load-path "~/.emacs.d/local/")

;;Hide menu bar, tool bar and scroll bar
;;early on in startup to avoid having these elements flash on then off.
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;;Package managers
(load "cmb-packages.el")

;;Macros for navigating emacs frames and files
(load "cmb-navigation.el")

;;Macros for editing plaintext
(load "cmb-textedit.el")

;;Customized appearance
(load "cmb-appearance.el")

;;Settings for editing python
(load "cmb-python.el")

;;Various packages that I just always switch on
(require 'hackernews)


;; Load files any specific to local machine, which are stored
;; in user-emacs-directory/local/
(setq local-settings-dir
      (concat user-emacs-directory "local/"))
(when (file-exists-p local-settings-dir)
  (mapc 'load (directory-files local-settings-dir nil "^[^#].*el$")))
