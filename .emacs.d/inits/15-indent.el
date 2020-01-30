;;; 15-indent.el --- Configs for indent-guildes
;;; Commentary:
;;; Code:
(use-package highlight-indent-guides
    :diminish
    :hook
    ((prog-mode yaml-mode) . highlight-indent-guides-mode)
    :custom
    (highlight-indent-guides-auto-enabled t)
    (highlight-indent-guides-responsive t)
    (highlight-indent-guides-method 'character)) ; column

;;; 15-indent.el ends here
