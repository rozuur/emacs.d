;;; init-recentf.el -*- coding: utf-8; lexical-binding: t; -*-

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

(global-set-key (kbd "C-x f") 'recentf-ido-find-file) ;; Key binding
(setq recentf-max-saved-items 100) ;; just 20 is too recent

(provide 'init-recentf)
