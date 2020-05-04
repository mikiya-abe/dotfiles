;;; 10-font.el --- for font family and size
;;; Commentary:
;;; Code:

(add-to-list
 'default-frame-alist
 '(font . "Source Code Pro for Powerline-13"))

;; 日本語フォントを設定
(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "Noto Sans Mono CJK JP-13"))

;; フォントの横幅を調整
(add-to-list 'face-font-rescale-alist '(".*Noto.*" . 1.2))

;; 0123456789
;; 一二三四五六

;;; 10-font.el ends here
