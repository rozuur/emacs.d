;;; init-ui.el -*- coding: utf-8; lexical-binding: t; -*-

(straight-use-package 'leuven-theme)

(load-theme 'leuven t)

;; In leuven, fontify the whole line for headings (with a background color).
(setq org-fontify-whole-heading-line t)


(provide 'init-looks)
