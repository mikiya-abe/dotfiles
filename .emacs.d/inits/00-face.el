;;; 00-face.el --- Appearance
;;; Commentary:
;;; Code:

;; カーソル行をハイライトする
;; (global-hl-line-mode t)

;;透明度
;; (custom-set-faces
;;  '(default ((t (:background nil)))))

;; スクロールを一行ずつにする
(setq scroll-step 1)

;; メニューを非表示にする
(menu-bar-mode 0)

;; スクロールバーを非表示
(scroll-bar-mode 0)

;; ツールバーを非表示にする
(tool-bar-mode 0)

;; "^L"を罫線として表示
(page-break-lines-mode t)

;; which-key
(use-package which-key
  :diminish which-key-mode
  :init
  ;; 画面幅に応じて右端または下部に表示
  (which-key-setup-side-window-right-bottom)
  (which-key-mode t))

;; amx
(use-package amx)

;; Beacon
(use-package beacon
  :custom
  (beacon-color "purple")
  :config
  (if window-system (beacon-mode 1)))

;; 括弧を虹色にする
(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

;; 対応する括弧を見やすくする
(use-package paren
  :ensure nil
  :hook
  (after-init . show-paren-mode)
  :custom-face
  (show-paren-match ((nil (:background "#44475a" :foreground "#f1fa8c"))))
  :custom
  (show-paren-style 'mixed)
  (show-paren-when-point-inside-paren t)
  (show-paren-when-point-in-periphery t))

;;; 00-face.el ends here
