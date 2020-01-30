;;; 03-linum.el --- custom settings for line number
;;; Commentary:
;;; Code:

;;行番号を常に表示する
(global-display-line-numbers-mode t)

;;行番号をあらかじめ3桁分確保
(setq linum-format "%3d ")

;;; 03-linum.el ends here
