;;; inittangle.el  --- To tangle init.el from init.org
;;; Commentary:
;; Tangle script to get init.el from init.org
;;; Code:
(progn
  (require 'org)
  (require 'ob)
  (require 'ox)
  (require 'ob-tangle)
  (find-file "init.org")
  (setq org-src-preserve-indentation t)
  (org-export-expand-include-keyword)
  (custom-set-variables '(org-babel-pre-tangle-hook nil)
                        '(org-use-property-inheritance t))
  (org-babel-tangle nil)
  )
;;; inittangle.el ends here

