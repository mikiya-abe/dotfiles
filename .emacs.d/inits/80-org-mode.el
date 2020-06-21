;;; 80-org-mode.el --- for org-mode
;;; Commentary:
;;; Code:

; ファイルの場%所
(setq org-directory "~/Dropbox/app/Emacs/Org")

;; org-journal
(use-package org-journal
  :ensure t
  :defer t
  :custom
  (org-journal-dir "~/Dropbox/app/Emacs/Org/Journal")
  (org-journal-date-format "%A, %d %B %Y"))

;; org-bullets
(use-package org-bullets
      :hook (org-mode . org-bullets-mode))

(setq org-todo-keywords
  '((sequence "TODO" "DOING" "|" "DONE")))

(defun org-journal-find-location ()
  (org-journal-new-entry t)
  (goto-char (point-min)))

;; Org-captureのテンプレート

;; Template expansion
;; https://orgmode.org/manual/Template-expansion.html#Template-expansion
;;
;; %t: タイムスタンプ(日付のみ)
;; %T: タイムスタンプ(日付と時刻)
;; %u: 非アクティブなタイムスタンプ(日付のみ) 非アクティブなタイムスタンプはagendaに影響しない
;; %U: 非アクティブなタイムスタンプ(日付と時刻)
;; %?: テンプレートを補完した後のカーソルの位置
;; %i: リージョンがアクティブな状態でcaptureが呼び出されたときに、挿入されるリージョン

(setq org-capture-templates
      '(("t" "✅ Todo" entry (file+headline "~/Dropbox/app/Emacs/Org/task.org" "Tasks")
         "* TODO %?\n   %U\n  %i\n  ")
        ("m" "💡 Memo" entry (file+datetree "~/Dropbox/app/Emacs/Org/memo.org")
         "* %?\nEntered on %U\n  %i\n  ")
        ("j" "🗓  Journal entry" entry (function org-journal-find-location)
         "* %(format-time-string org-journal-time-format)%^{Title}\n%i%?")))

(defun show-org-buffer (file)
  "Show an org-file FILE on the current buffer."
  (interactive)
  (if (get-buffer file)
      (let ((buffer (get-buffer file)))
        (switch-to-buffer buffer)
        (message "%s" file))
    (find-file (concat "~/Dropbox/app/Emacs/Org/" file))))

(defun open-memo ()
  "Show an memo.org."
  (interactive)
  (show-org-buffer "memo.org"))

(defun open-task ()
  "Show an task.org."
  (interactive)
  (show-org-buffer "task.org"))

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
      (javascript . t)))

;;; 80-org-mode.el ends here
