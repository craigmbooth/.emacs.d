;;Favorite color scheme (M-x package-install zenburn-theme)
(load-theme 'zenburn t)

;;;Always show column number
(column-number-mode 1)

;;Show line numbers to left of screen
(global-linum-mode t)

;;Make the cursor stretch when it's on a wide-char like a tab:
(setq x-stretch-cursor t)

;;When opening two files with the same name, don't name
;;the second one file<2>, instead prepend the directory
(require 'uniquify)
  (setq uniquify-buffer-name-style 'forward)

;;highlight matching parens
(show-paren-mode 1)

;;put emacs: [buffer name] in frame title
(setq frame-title-format
  '("emacs: " (buffer-file-name "%f"
                 (dired-directory dired-directory "%b")
              )
   )
)
