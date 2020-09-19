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


;;; recentf

(add-hook 'after-init-hook 'recentf-mode)

(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let* ((file-assoc-list
          (mapcar (lambda (x)
                    (cons (file-name-nondirectory x)
                          x))
                  recentf-list))
         (filename-list
          (cl-remove-duplicates (mapcar #'car file-assoc-list)
                             :test #'string=))
         (filename (ido-completing-read "Choose recent file: "
                                        filename-list
                                        nil
                                        t)))
    (when filename
      (find-file (cdr (assoc filename
                             file-assoc-list))))))


;; Key binding
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)

(setq recentf-max-saved-items 100
      recentf-max-menu-items 15
      ;; disable recentf-cleanup on Emacs start, because it can cause
      ;; problems with remote files
      recentf-auto-cleanup 'never)

;;; Saving history
(setq savehist-additional-variables
      ;; search entries
      '(search-ring regexp-search-ring)
      ;; save every minute
      savehist-autosave-interval 60
      ;; keep the home clean
      savehist-file (expand-file-name "savehist" user-emacs-directory))
(savehist-mode t)

(provide 'init-backups)
