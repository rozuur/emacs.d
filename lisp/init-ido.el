;;; init-ido.el -*- coding: utf-8; lexical-binding: t; -*-

(require 'ido)
(require 'ido-completing-read+)

(ido-mode t)
(ido-yes-or-no-mode t)
(ido-ubiquitous-mode t)


(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-save-directory-list-file (expand-file-name "ido.hist" user-emacs-directory)
      ido-default-file-method 'selected-window
      ido-auto-merge-work-directories-length nil)


(provide 'init-ido)
