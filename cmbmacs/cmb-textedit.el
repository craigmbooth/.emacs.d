;; Definitions to be used when doing plaintext editing

;;Spellcheck latex documents
(add-hook 'latex-mode-hook
  (lambda()
    (flyspell-mode 1)))

(setq default-abbrev-mode t)
(diminish 'abbrev-mode)

(provide 'cmb-textedit)
