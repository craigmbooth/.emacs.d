;; Definitions to be used when doing plaintext editing

;; Spellcheck latex documents
(add-hook 'latex-mode-hook
  (lambda()
    (flyspell-mode 1)))

;; Activate abbrev mode and ensure the correct abbrev
;; file is used
(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq default-abbrev-mode t)

;; Ensure all relevant files are handled by markdown mode
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))

(provide 'cmb-textedit)

;; Provides M0x beautify-json
(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
      "python -mjson.tool" (current-buffer) t)))
