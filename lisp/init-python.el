;;; init-python.el -*- coding: utf-8; lexical-binding: t; -*-

(require 'anaconda-mode)
(require 'company-anaconda)
(require 'blacken)
(require 'py-autopep8)
(require 'flycheck)


(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))

;; Enable Flycheck
(add-hook 'python-mode-hook 'flycheck-mode)
;; Enable autopep8
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
;; Format using black when save
(add-hook 'python-mode-hook 'blacken-mode)
;; Enable anaconda
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)


(setq blacken-line-length 120)

(provide 'init-python)
