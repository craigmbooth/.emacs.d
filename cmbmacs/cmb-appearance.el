;;Zenburn theme with electric pink cursor
(when (> emacs-major-version 23)
(progn 
  (load-theme 'zenburn t)
  (add-to-list 'default-frame-alist '(cursor-color . "#f00bac"))
))

;;Stop the cursor from blinking
(blink-cursor-mode -1)

;;Always show column number
(column-number-mode 1)

;;Highlight the current buffer
(auto-dim-other-buffers-mode 1)
(diminish 'auto-dim-other-buffers-mode) ;;Hide from minor-mode list

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
    (dired-directory dired-directory "%b"))))

;;Let [f11] toggle fullscreen
(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(global-set-key [f11] 'toggle-fullscreen)


(provide 'cmb-appearance)
