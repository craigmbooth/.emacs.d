;;;Repositories for emacs packages
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")  

(require 'package)
(require 'cl)

;;; Packages to be installed by package
(defvar cmb-packages
  '(zenburn-theme
    python-mode
    typing auctex
    auto-dim-other-buffers
    pretty-lambdada
    diminish
    w3m
    hackernews
    guru-mode
    highlight-indentation
    markdown-mode
    zoom-frm
    ace-jump-mode
    )
  "Ensure all the following packages are installed via package manager.")

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)


(defun cmb-packages-installed-p ()
  (loop for p in cmb-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

;;Loop over packages and if one is not found, install it:
(unless (cmb-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p cmb-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(if (>= emacs-major-version 24)
   (progn
     (unless (require 'el-get nil 'noerror)
       (with-current-buffer
	   (url-retrieve-synchronously
	    "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
	 (let (el-get-master-branch)
	   (goto-char (point-max))
	   (eval-print-last-sexp))))
	   ;Append packages we wanto to el-get's list:
         (setq my-el-get-packages  
          (append  
           '(jedi)  
           (mapcar 'el-get-source-name el-get-sources)))  
           (el-get 'sync my-el-get-packages)  
   )
   (progn
    (message "Emacs version < 24, skipping el-get")
   )
)

(provide 'cmb-packages)
