(unless (boundp 'rjp/emacs-in-update)
  ;; Package is disabled unless we are in update mode.
  ;; Even the quickstart export is not used.
  ;; package-enable-at-startup was changed from nil to t to fix magit.
  ;; But this was a symptom, the cause was due to default packages being loaded
  ;; earlier than custom additions.  That is fixed so this is now reverted.
  (setq package-enable-at-startup nil)
  (setq package-load-list nil)
  (setq package-quickstart t)
  )
