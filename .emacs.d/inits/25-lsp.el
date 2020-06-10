;;; 25-lsp.el --- LSP protocol
;;; Commentary:
;;; Code:

;; configure the package to point to the sourcekit-lsp executable
(use-package lsp-sourcekit
  :after lsp-mode
  :config
  (setq lsp-sourcekit-executable "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp"))

;; enable lsp automatically whenever you visit a .swift file
(use-package swift-mode
  :hook
  (swift-mode . (lambda () (lsp)))
  (lisp-mode . (lambda () (lsp))))

(use-package lsp-mode
  :config
  (use-package lsp-ui
    :custom
    ;; lsp-ui-doc
    (lsp-ui-doc-enable t)
    (lsp-ui-doc-header t)
    (lsp-ui-doc-include-signature t)
    (lsp-ui-doc-position 'top) ;; top, bottom, or at-point
    (lsp-ui-doc-max-width 100)
    (lsp-ui-doc-max-height 30)
    (lsp-ui-doc-use-childframe t)
    (lsp-ui-doc-use-webkit t)
    ;; lsp-ui-flycheck
    (lsp-ui-flycheck-enable nil)
    ;; lsp-ui-sideline
    (lsp-ui-sideline-enable nil)
    (lsp-ui-sideline-ignore-duplicate t)
    (lsp-ui-sideline-show-symbol t)
    (lsp-ui-sideline-show-hover t)
    (lsp-ui-sideline-show-diagnostics nil)
    (lsp-ui-sideline-show-code-actions nil)
    ;; lsp-ui-imenu
    (lsp-ui-imenu-enable nil)
    (lsp-ui-imenu-kind-position 'top)
    ;; lsp-ui-peek
    (lsp-ui-peek-enable t)
    (lsp-ui-peek-peek-height 30)
    (lsp-ui-peek-list-width 8)
    (lsp-ui-peek-fontify 'always) ;; never, on-demand, or always
    :bind
    (:map lsp-mode-map
    ("C-c C-r" . lsp-ui-peek-find-references)
    ("C-c C-j" . lsp-ui-peek-find-definitions)
    ("C-c i"   . lsp-ui-peek-find-implementation)
    ("C-6"     . lsp-ui-imenu)
    ("C-c s"   . lsp-ui-sideline-mode))
    :hook
    (lsp-mode . lsp-ui-mode)))


(require 'smart-jump)
(smart-jump-setup-default-registers)
(global-set-key (kbd "s-b") 'smart-jump-go)

(require 'company-sourcekit)
(add-to-list 'company-backends 'company-sourcekit)

;;; 25-lsp.el ends here
