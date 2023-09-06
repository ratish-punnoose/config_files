;;; update.el  --- To update all use-packages if needed from repos.
;;; Commentary:
;; Update script to download packages when needed
;;; Code:
(require 'package)
(require 'use-package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/")
 t)
(package-initialize)
(package-refresh-contents)
;; (package-install 'use-package)
(package-install 'diminish)
(package-install 'use-package-hydra)
(package-install 'auto-package-update)

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
(print "========= setting rjp/emacs-in-update")
(load-file "init.el")

(print "========== Done loading init.el ============")

(if (string= (nth 0 argv) "force")
    (progn
      (print "doing force update")
      (use-package auto-package-update
        :config
        (setq auto-package-update-delete-old-versions t)
        (auto-package-update-now)))
  (print "not forcing update")
  )
(package-quickstart-refresh)
;;; update.el ends here

