;;; update.el  --- To update all use-packages if needed from repos.
;;; Commentary:
;; Update script to download packages when needed
;;; Code:
(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.milkbox.net/packages/")
 t)
(package-initialize)
(package-refresh-contents)
(package-install 'use-package)
(package-install 'diminish)

(require 'seq)
(defun rjp/get-dir-and-subdirs (dirname)
  "Provide list of directory and its direct subdirectories."
  (interactive)
  (if (file-accessible-directory-p dirname)
      (append (list dirname) (seq-filter  'file-directory-p
                                          (nthcdr 2 ;; Remove ".", ".."
                                                  (directory-files dirname t))))
    nil))
(setq load-path (append load-path
                        (rjp/get-dir-and-subdirs
                         (expand-file-name "elpa/"
                                           user-emacs-directory))
                         (rjp/get-dir-and-subdirs
                          (expand-file-name "lisp/"
                                            user-emacs-directory))
                        ))
(require 'use-package-ensure)
(setq use-package-always-ensure t)
(setq package-load-list '(all
                          ))
(setq rjp/emacs-in-update t)
(load-file "init.el")
(if (string= (nth 1 argv) "force")
    (use-package auto-package-update
      :config
      (setq auto-package-update-delete-old-versions t)
      (auto-package-update-now)))
;;; update.el ends here

