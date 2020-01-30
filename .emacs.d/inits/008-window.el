;;; 008-window.el --- for window
;;; Commentary:
;;; Code:

;; 起動時のフレーム設定
(setq default-frame-alist
      (append (list
               '(top . -1)
               '(width . 140)
               '(height . 40)
               )
              default-frame-alist))

;;; 008-window.el ends here
