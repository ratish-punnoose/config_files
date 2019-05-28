;;; inittangle.el  --- To tangle init.el from init.org
;;; Commentary:
;; Tangle script to get init.el from init.org
;;; Code:
(package-initialize)
(require 'ob-tangle)
(org-babel-tangle-file "init.org")
;;; inittangle.el ends here

