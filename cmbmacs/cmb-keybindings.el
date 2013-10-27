;; Navigate quickly
(global-set-key "\C-cg" 'goto-line)
(global-set-key "\C-cG" 'goto-char)

;; Auto-comment and uncomment
(global-set-key "\C-cc" 'comment-region)
(global-set-key "\C-cu" 'uncomment-region)

;; Change font size
(require 'zoom-frm)

(global-set-key (kbd "C-+") 'zoom-in)
(global-set-key (kbd "C-=") 'zoom-in)
(global-set-key (kbd "C--") 'zoom-out)

;; Allow C-Mousewheel to zoom in and out like a web browser
(global-set-key (if (boundp 'mouse-wheel-down-event) ; Emacs 22+
                    (vector (list 'control
                                  mouse-wheel-down-event))
                  [C-mouse-wheel])    ; Emacs 20, 21
                'zoom-in)
(when (boundp 'mouse-wheel-up-event) ; Emacs 22+
  (global-set-key (vector (list 'control mouse-wheel-up-event))
                  'zoom-out))

(global-set-key [S-mouse-1]    'zoom-in)
(global-set-key [C-S-mouse-1]  'zoom-out)

;; Function defined in cmb-appearance
(global-set-key (kbd "C-c t") 'toggle-transparency)

;; Unbind C-z
(global-unset-key (kbd "C-z"))

(provide 'cmb-keybindings)
