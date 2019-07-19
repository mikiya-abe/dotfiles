;;; init.el --- for general
;;; Commentary:
;;
;; M-x package-refresh-contents
;; M-x package-install-selected-packges
;;
;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/" ))
(package-initialize)

;; Load path
(setq load-path
      (append '("~/.emacs.d/elpa/"
                "~/.emacs.d/lisp/"
                "~/.emacs.d/themes/")
              load-path))

(require 'init-loader)
(init-loader-load)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(beacon-color "purple")
 '(doom-themes-enable-bold t)
 '(doom-themes-enable-italic t)
 '(package-selected-packages
   (quote
    (which-key spinner lsp-mode use-package page-break-lines flycheck-color-mode-line restart-emacs dashboard rainbow-delimiters doom-modeline ivy-rich beacon git-gutter projectile dashboard-project-status company-box company-lsp company ivy magit neotree doom-themes ac-helm websocket web-server uuidgen powerline package-utils nyan-mode init-loader flycheck dracula-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doom-modeline-bar ((t (:background "#636463")))))
