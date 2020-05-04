;;; 40-modeline.el --- Set modeline-format
;;; Commentary:
;;; Code:

(use-package doom-modeline
  :ensure t
  :custom
  (doom-modeline-buffer-file-name-style 'file-name)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-vcs-max-length 30)
  (doom-modeline-buffer-encoding nil nil nil "Customized with use-package doom-modeline")
  (doom-modeline-buffer-file-name-style (quote file-name) nil nil "Customized with use-package doom-modeline")
  (doom-modeline-minor-modes t)
  (doom-modeline-vcs-max-length 30 nil nil "Customized with use-package doom-modeline")
  :hook
  (after-init . doom-modeline-mode))

(if window-system
    (use-package nyan-mode
      :custom
      (nyan-animate-nyancat t)
      :hook
      ;; (after-init . nyan-mode)
      (doom-modeline-mode . nyan-mode)))

;;; 40-modeline.el ends here
