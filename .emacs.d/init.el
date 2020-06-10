;;; init.el --- for general
;;; Commentary:
;;
;; M-x package-refresh-contents
;; M-x package-install-selected-packges
;; M-x all-the-icons-install-fonts
;;
;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Avoid a bug #34341
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
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
 '(ansi-color-names-vector
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(beacon-color "#62f992")
 '(custom-safe-themes
   (quote
    ("1526aeed166165811eefd9a6f9176061ec3d121ba39500af2048073bea80911e" "0301a26dedfda81ca220ad6169588b5408884e7b4a5363f3e6a0e98d5c65a257" default)))
 '(doom-modeline-buffer-encoding nil)
 '(doom-modeline-buffer-file-name-style (quote file-name))
 '(doom-modeline-minor-modes t)
 '(doom-modeline-vcs-max-length 30)
 '(doom-themes-enable-bold t)
 '(doom-themes-enable-italic t)
 '(fci-rule-color "#6272a4")
 '(git-gutter:added-sign "+")
 '(git-gutter:deleted-sign "-")
 '(git-gutter:modified-sign "~")
 '(highlight-indent-guides-auto-enabled t)
 '(highlight-indent-guides-method (quote character))
 '(highlight-indent-guides-responsive t)
 '(jdee-db-active-breakpoint-face-colors (cons "#1E2029" "#bd93f9"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1E2029" "#50fa7b"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1E2029" "#565761"))
 '(lsp-ui-doc-enable t t)
 '(lsp-ui-doc-header t t)
 '(lsp-ui-doc-include-signature t t)
 '(lsp-ui-doc-max-height 30 t)
 '(lsp-ui-doc-max-width 100 t)
 '(lsp-ui-doc-position (quote top) t)
 '(lsp-ui-doc-use-childframe t t)
 '(lsp-ui-doc-use-webkit t t)
 '(lsp-ui-flycheck-enable nil t)
 '(lsp-ui-imenu-enable nil t)
 '(lsp-ui-imenu-kind-position (quote top) t)
 '(lsp-ui-peek-enable t t)
 '(lsp-ui-peek-fontify (quote always) t)
 '(lsp-ui-peek-list-width 8 t)
 '(lsp-ui-peek-peek-height 30 t)
 '(lsp-ui-sideline-enable nil t)
 '(lsp-ui-sideline-ignore-duplicate t t)
 '(lsp-ui-sideline-show-code-actions nil t)
 '(lsp-ui-sideline-show-diagnostics nil t)
 '(lsp-ui-sideline-show-hover t t)
 '(lsp-ui-sideline-show-symbol t t)
 '(objed-cursor-color "#ff5555")
 '(org-journal-date-format "%A, %d %B %Y" t)
 '(org-journal-dir "~/Dropbox/app/Emacs/Org/Journal" t)
 '(package-selected-packages
   (quote
    (company-sourcekit lsp-ui smart-jump lsp-mode swift3-mode lsp-sourcekit all-the-icons-ivy-rich markdown-preview-mode json-mode org-journal markdown-preview-eww vimrc-mode all-the-icons-gnus ghub all-the-icons-dired volatile-highlights highlight-indent-guides amx ob-swift ob-http ob-kotlin org-preview-html git-gutter+ persistent-scratch highlight2clipboard swift-mode lua-mode docker-compose-mode which-key spinner use-package page-break-lines flycheck-color-mode-line restart-emacs dashboard rainbow-delimiters doom-modeline ivy-rich beacon git-gutter projectile dashboard-project-status company-box company-lsp company ivy magit neotree doom-themes ac-helm websocket web-server uuidgen powerline package-utils nyan-mode init-loader flycheck dracula-theme)))
 '(pdf-view-midnight-colors (cons "#f8f8f2" "#282a36"))
 '(rustic-ansi-faces
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(setq nil t)
 '(show-paren-style (quote mixed))
 '(show-paren-when-point-in-periphery t)
 '(show-paren-when-point-inside-paren t)
 '(vc-annotate-background "#282a36")
 '(vc-annotate-color-map
   (list
    (cons 20 "#50fa7b")
    (cons 40 "#85fa80")
    (cons 60 "#bbf986")
    (cons 80 "#f1fa8c")
    (cons 100 "#f5e381")
    (cons 120 "#face76")
    (cons 140 "#ffb86c")
    (cons 160 "#ffa38a")
    (cons 180 "#ff8ea8")
    (cons 200 "#ff79c6")
    (cons 220 "#ff6da0")
    (cons 240 "#ff617a")
    (cons 260 "#ff5555")
    (cons 280 "#d45558")
    (cons 300 "#aa565a")
    (cons 320 "#80565d")
    (cons 340 "#6272a4")
    (cons 360 "#6272a4")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doom-modeline-bar ((t (:background "#636463"))))
 '(git-gutter:added ((t (:background "#50fa7b"))))
 '(git-gutter:deleted ((t (:background "#ff79c6"))))
 '(git-gutter:modified ((t (:background "#f1fa8c"))))
 '(show-paren-match ((nil (:background "#44475a" :foreground "#f1fa8c")))))
