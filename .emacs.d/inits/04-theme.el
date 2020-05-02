;;; 04-theme.el --- theme settings
;;; Commentary:
;;; Code:

(when window-system
  ;; Use dracula-theme
  ;; Make sure a symbolic link from dracula-theme.el exists
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
  (load-theme 'dracula t))

(when (not window-system)
  (use-package doom-themes
    :custom
    (doom-themes-enable-italic t)       ; if nil, bold is universally disabled
    (doom-themes-enable-bold t)         ; if nil, italics is universally disabled
    :custom-face
    (doom-modeline-bar ((t (:background "#636463"))))
    :config
    (load-theme 'doom-dracula t)
    (doom-themes-neotree-config)
    (doom-themes-org-config))

  ;; other options
  ;; linum
  (set-face-attribute 'line-number nil
                      :foreground "#999999")
  (set-face-attribute 'line-number-current-line nil
                      :foreground "#59f68d")

  (set-face-background 'region "#565A6D")

  ;; comment & doc (see also 'font-lock-string-face)
  (set-face-foreground 'font-lock-comment-face "#8292c4")
  (set-face-foreground 'font-lock-doc-face "#8292c4")

  ;; cursol
  (set-cursor-color "#62f992")
  )

;;; 04-theme.el ends here
