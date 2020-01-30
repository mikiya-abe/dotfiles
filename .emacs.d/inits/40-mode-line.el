;;; 40-mode-line.el --- Set mode-line-format
;;; Commentary:
;;; Code:

(setq mode-line-format
      (list
       '(:eval (list (nyan-create)))
       ))
(if window-system (nyan-mode 1))

;;; 40-mode-line.el ends here
