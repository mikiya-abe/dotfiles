;;; 05-keybind.el --- keys
;;; Commentary:
;;; Code:

;; optionをメタキーにする
(setq mac-option-modifier 'meta)

;; C-hにbackspaceと同じ処理を割り当てる
(global-set-key "\C-h" 'delete-backward-char)

;; neotree
(require 'neotree)
(global-set-key (kbd "s-1") 'neotree-toggle)

;; org-mode
(global-set-key (kbd "C-c p") 'org-preview-html-mode)

;; Org-captureを呼び出す
(define-key global-map "\C-cc" 'org-capture)

;; Org-agendaを呼び出す
(define-key global-map "\C-ca" 'org-agenda)

;; memo.orgを開く
(global-set-key (kbd "C-c m") 'open-memo)

;; org-modeで"d"を押して、タスクの状態をDONEにする
(add-to-list 'org-speed-commands-user '("d" org-todo "DONE"))

(use-package company
  :bind
  (:map company-active-map
        ("C-p" . company-select-previous)
        ("C-n" . company-select-next)
        :map company-search-map
        ("C-p" . company-select-previous)
        ("C-n" . company-select-next)))

;; TODO
;; M-; -> comment-line

;;; 99-keybind.el ends here
