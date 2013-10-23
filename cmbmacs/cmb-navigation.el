(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;; New keyboard shortcuts:
(global-set-key "\C-cg" 'goto-line)
(global-set-key "\C-cG" 'goto-char)
(global-set-key "\C-cc" 'comment-region)
(global-set-key "\C-cu" 'uncomment-region)

;;Interactively do things.  Better autocompleteion
(require 'ido)
(ido-mode t)

;;allow ~ to take you directly home in ido-find-file
(add-hook 'ido-setup-hook
 (lambda ()
   ;; Go straight home
   (define-key ido-file-completion-map
     (kbd "~")
     (lambda ()
       (interactive)
       (if (looking-back "/")
           (insert "~/")
         (call-interactively 'self-insert-command))))))


;; allow shorter answers than [yes] or [no]
(defalias 'yes-or-no-p 'y-or-n-p)

;; always indent with spaces
(setq-default indent-tabs-mode nil)

;; Move the *~ files to ~/.emacs.d/saves/ 
(unless (file-exists-p "~/.emacs.d/saves/")
  (make-directory "~/.emacs.d/saves/"))

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs.d/saves/"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;;Enable windmove bindings so that shift-<direction> moves
;;Between buffers
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;;Suppress use of arrow keys:
(require 'guru-mode)
(guru-global-mode +1)
(diminish 'guru-mode) ;;Hide from minor-mode list

;; Undo/redo window configuration with C-c <left>/<right>
(winner-mode 1)

(provide 'cmb-navigation)
