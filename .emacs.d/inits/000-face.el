;;; 000-face.el --- Appearance
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
(which-key-mode 1)

;; Beacon
(use-package beacon
             :custom
             (beacon-color "purple")
             :config
             (if window-system (beacon-mode 1)))

;;; 000-face.el ends here
