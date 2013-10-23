(when (< emacs-major-version 24)
  (message "Will be missing some features with emacs major version < 24"))
(message "Starting up with emacs version %s" emacs-version)

(add-to-list 'load-path "~/.emacs.d/packages/")
(add-to-list 'load-path "~/.emacs.d/cmbmacs/")
(add-to-list 'load-path "~/.emacs.d/local/")

;;Hide menu bar, tool bar, scroll barand splash screen
;;early on in startup to avoid having these elements flash on then off.
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-message t)

(require 'cmb-packages)  ;;Package managers
(require 'cmb-navigation)  ;;Macros for navigating emacs frames and files
(require 'cmb-textedit)  ;;Macros for editing plaintext
(require 'cmb-appearance)  ;;Customized appearance
(require 'cmb-python)  ;;Settings for editing python

;;Various packages that I just always switch on
(require 'hackernews)
(require 'guru-mode)
(guru-global-mode +1)


;; Load files any specific to local machine, which are stored
;; in user-emacs-directory/local/
(setq local-settings-dir
      (concat user-emacs-directory "local/"))
(when (file-exists-p local-settings-dir)
  (mapc 'load (directory-files local-settings-dir nil "^[^#].*el$")))
