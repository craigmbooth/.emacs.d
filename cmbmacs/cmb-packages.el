;;;Repositories for emacs packages
(require 'package)
(require 'cl)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(defvar cmb-packages
  '(zenburn-theme python-mode jedi)
  "Ensure all the following packages are installed via package manager.")

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
