;;; 60-company.el --- for company
;;; Commentary:
;;; Code:

(add-hook 'after-init-hook 'global-company-mode)

(require 'company-lsp)
(push 'company-lsp company-backends)

(require 'company-box)
(add-hook 'company-mode-hook 'company-box-mode)

(use-package company
  :custom
  (setq company-auto-complete t)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t)
  (setq completion-ignore-case t))

;;; 60-company.el ends here
