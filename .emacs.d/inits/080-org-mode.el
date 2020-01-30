;;; 080-org-mode.el --- for org-mode
;;; Commentary:
;;; Code:

; Org-captureを呼び出すキーシーケンス
(define-key global-map "\C-cc" 'org-capture)

;; スピードコマンドを有効化
(setq org-use-speed-commands t)

;; org-babelに使用できる言語を追加する
(org-babel-do-load-languages 'org-babel-load-languages
    '(
      (shell . t)
      (swift . t)
      (python . t)
      (kotlin . t)
      (emacs-lisp . t)
      )
    )

;;; 080-org-mode.el ends here
