;;; 010-font.el --- for font family and size
;;; Commentary:
;;; Code:

(add-to-list
 'default-frame-alist
 '(font . "Source Code Pro for Powerline-13"))

(set-fontset-font
 nil
 'japanese-jisx0208
 (font-spec :family "Noto Sans JP" :size 13))

;;; 010-font.el ends here
