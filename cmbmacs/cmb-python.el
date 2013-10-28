(require 'python-mode)
(require 'highlight-indentation)
 
(defun activate-cmb-python-settings ()
  "This function to be called from python-mode-hook sets the
  required modes"  
  (progn
    (whitespace-mode +1)
    (diminish 'whitespace-mode)
    (highlight-indentation-mode +1)
    (diminish 'highlight-indentation-mode)
    (diminish 'auto-complete-mode)
    (pretty-lambda-mode +1)))

(add-hook 'python-mode-hook 'activate-cmb-python-settings)

;;Highlight trailing whitespace and lines over 80 characters
(setq whitespace-line-column 80
        whitespace-style '(face tabs trailing lines-tail))
   
;; Stuff for jedi:
(when (>= emacs-major-version 24)
  (add-hook 'python-mode-hook 'jedi:setup))
(setq jedi:setup-keys t)       ;add key bindings
(setq jedi:complete-on-dot t)  ;always autocomplete after typing .
(setq jedi:tooltip-method nil) ;function signature in minibuffer
 
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
   
(provide 'cmb-python)
