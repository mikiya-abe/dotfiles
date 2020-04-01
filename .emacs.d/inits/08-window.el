;;; 08-window.el --- for window
;;; Commentary:
;;; Code:

;; 起動時のフレーム設定
(setq default-frame-alist
      (append (list
               '(top . 200)
               '(left . 450)
               '(width . 140)
               '(height . 50)
               )
              default-frame-alist))

;;; 08-window.el ends here
