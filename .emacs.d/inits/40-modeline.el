;;; 40-modeline.el --- Set modeline-format
;;; Commentary:
;;; Code:

(use-package doom-modeline
  :ensure t
  :custom
  (doom-modeline-buffer-file-name-style 'file-name)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-vcs-max-length 30)
  :hook
  (after-init . doom-modeline-mode)
  )

(if window-system
    (use-package nyan-mode
      :hook
      (after-init . nyan-mode)))

;;; 40-modeline.el ends here
