;;; 09-markdown.el --- Enable markdown-mode
;;; Commentary:
;;; Code:

(autoload 'markdown-preview-mode "markdown-preview-mode.el" t)

;;; markdown preview mode
;;(setq markdown-preview-stylesheets (list "github.css"))
(setq markdown-preview-stylesheets
      (list "https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/3.0.1/github-markdown.min.css"))

;;; 09-markdown.el ends here
