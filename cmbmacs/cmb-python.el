;;Highlight trailing whitespace and lines over 80 characters
(add-hook 'python-mode-hook 'whitespace-mode)
(setq whitespace-line-column 80
      whitespace-style '(face tabs trailing lines-tail))

;;Highlight indentations with vertical lines
(add-hook 'python-mode-hook 'highlight-indentation-mode)

;; Stuff for jedi (M-x el-get-install jedi):
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)       ;add key bindings
(setq jedi:complete-on-dot t)  ;always autocomplete after typing .
(setq jedi:tooltip-method nil) ;function signature in minibuffer

;;Spellcheck comments in python documents
(add-hook 'python-mode-hook
   (lambda()
      flyspell-prog-mode 1))

