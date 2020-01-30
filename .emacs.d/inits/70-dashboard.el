;;; 70-dashboard.el --- for dashboard
;;; Commentary:
;;; Code:

(use-package dashboard
  :ensure t
  :if (< (length command-line-args) 2)
  :config
  (dashboard-setup-startup-hook)
  ;; Set the title
  (setq dashboard-banner-logo-title "Welcome to Emacs!")
  ;; Set the banner
  (setq dashboard-startup-banner 'logo)
  ;; Value can be
  ;; 'official which displays the official emacs logo
  ;; 'logo which displays an alternative emacs logo
  ;; 1, 2 or 3 which displays one of the text banners
  ;; "path/to/your/image.png" which displays whatever image you would prefer

  ;; Content is not centered by default. To center, set
  (setq dashboard-center-content t)

  (setq dashboard-items '((recents  . 10)
                          (projects . 5)))
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*"))))

(add-to-list 'auto-mode-alist '("\\*dashboard*\\'" . dashboard-mode))

;;; 70-dashboard.el ends here
