;;; init-python.el -*- coding: utf-8; lexical-binding: t; -*-

(require 'anaconda-mode)
(require 'company-anaconda)
(require 'blacken)

(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(add-hook 'python-mode-hook 'blacken-mode)

(setq blacken-line-length 120)

(provide 'init-python)
