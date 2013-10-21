(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;;;Repositories for emacs packages
(require 'package)
(require 'cl)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)



(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))


(setq el-get-sources '(el-get jedi))
(el-get 'sync)

;;; Packages to be installed by package
(defvar cmb-packages
  '(zenburn-theme python-mode)
  "Ensure all the following packages are installed via package manager.")

;;; Packages to be installed by el-get

(defun cmb-packages-installed-p ()
  (loop for p in cmb-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (cmb-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p cmb-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(load-theme 'zenburn t)
