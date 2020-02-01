;;; 06-flycheck.el --- for flycheck
;;; Commentary:
;;; Code:

;; for flycheck
(global-flycheck-mode)

(use-package flycheck-swift
  :hook
  ((swift-mode) . '('flycheck '(flycheck-swift-setup))))

;;; 06-flycheck.el ends here
