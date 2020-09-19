;;; straight.el -*- coding: utf-8; lexical-binding: t; -*-

;; Bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


;; Also install packages
(straight-use-package 'leuven-theme)
(straight-use-package 'gcmh)
(straight-use-package 'ag)
(straight-use-package 'company)
(straight-use-package 'paren)
(straight-use-package 'flycheck)
(straight-use-package 'crux)
(straight-use-package 'ace-window)
(straight-use-package 'exec-path-from-shell)
(straight-use-package 'ido-yes-or-no)
(straight-use-package 'ido-completing-read+)


(provide 'straight)
