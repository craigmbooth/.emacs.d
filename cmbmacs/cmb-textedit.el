;; Definitions to be used when doing plaintext editing

;;Spellcheck latex documents
(add-hook 'latex-mode-hook
  (lambda()
    (flyspell-mode 1)))

(provide 'cmb-textedit)
