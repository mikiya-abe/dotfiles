;;; 005-keybind.el --- keys
;;; Commentary:
;;; Code:

;; optionをメタキーにする
(setq mac-option-modifier 'meta)

;; C-hにbackspaceと同じ処理を割り当てる
(global-set-key "\C-h" 'delete-backward-char)

;; neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; org-mode
(global-set-key (kbd "C-c p") 'org-preview-html-mode)

;; TODO
;; M-; -> comment-line

;;; 005-keybind.el ends here
