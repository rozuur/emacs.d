;;; init-backups.el -*- coding: utf-8; lexical-binding: t; -*-

;; https://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files

(setq version-control t     ;; Use version numbers for backups.
      kept-new-versions 10  ;; Number of newest versions to keep.
      kept-old-versions 2   ;; Number of oldest versions to keep.
      delete-old-versions t ;; Don't ask to delete excess backup versions.
      auto-save-default t   ;; Auto-save every buffer that visits a file
      backup-by-copying t)  ;; Copy all files, don't rename them.

;; Also save version controlled files, as we don't commit on each save.
(setq vc-make-backup-files t)

;; Default and per-save backups go to temp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; autosave the undo-tree history
(setq undo-tree-history-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq undo-tree-auto-save-history t)

(provide 'init-backups)
