;; Definitions to be used when doing plaintext editing

;; Spellcheck latex documents
(add-hook 'latex-mode-hook
  (lambda()
    (flyspell-mode 1)))

;; Activate abbrev mode, diminish it and ensure the correct abbrev
;; file is used
(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq default-abbrev-mode t)
(diminish 'abbrev-mode)

;; Ensure all relevant files are handled by markdown mode
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))

(provide 'cmb-textedit)
