(require 'python-mode)

;;Highlight trailing whitespace and lines over 80 characters
(add-hook 'python-mode-hook 'whitespace-mode)
(setq whitespace-line-column 80
      whitespace-style '(face tabs trailing lines-tail))

;;Highlight indentations with vertical lines
(require 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation-mode)

;; Stuff for jedi:
(when (>= emacs-major-version 24)
(progn 
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:setup-keys t)       ;add key bindings
  (setq jedi:complete-on-dot t)  ;always autocomplete after typing .
  (setq jedi:tooltip-method nil) ;function signature in minibuffer
))

;; use IPython
;; C-c ! opens a python frame
;; C-c C-c executes the current buffer
;; C-c | executes the current region
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
  '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split windows
(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
(setq py-smart-indentation t)
