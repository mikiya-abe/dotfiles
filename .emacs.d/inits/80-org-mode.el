;;; 80-org-mode.el --- for org-mode
;;; Commentary:
;;; Code:

; ファイルの場所
(setq org-directory "~/Dropbox/app/Org")

;; Org-captureを呼び出す
(define-key global-map "\C-cc" 'org-capture)

;; Org-captureのテンプレート
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Dropbox/org/task.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("m" "Memo" entry (file+datetree "~/Dropbox/org/memo.org")
         "* %?\nEntered on %U\n  %i\n  %a")))

(defun show-org-buffer (file)
  "Show an org-file FILE on the current buffer."
  (interactive)
  (if (get-buffer file)
      (let ((buffer (get-buffer file)))
        (switch-to-buffer buffer)
        (message "%s" file))
    (find-file (concat "~/Dropbox/app/Org/" file))))
(global-set-key (kbd "C-c RET") '(lambda () (interactive)
                                 (show-org-buffer "memo.org")))


;; スピードコマンドを有効化
(setq org-use-speed-commands t)

(add-to-list 'org-speed-commands-user '("d" org-todo "DONE"))

;; org-babelに使用できる言語を追加する
(org-babel-do-load-languages 'org-babel-load-languages
    '(
      (shell . t)
      (swift . t)
      (python . t)
      (kotlin . t)
      (emacs-lisp . t)))

;;; 80-org-mode.el ends here
