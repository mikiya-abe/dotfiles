;;; 12-savefile.el --- something related to saving file
;;; Commentary:
;;; Code:

;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)

;; 自動セーブの中止
(setq auto-save-default nil)

;;; 12-savefile.el ends here
