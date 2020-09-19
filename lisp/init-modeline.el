;;; init-modeline.el -*- coding: utf-8; lexical-binding: t; -*-

(require 'powerline)
(require 'diminish)

;; Load modeline theme
(powerline-default-theme)


(diminish 'company-mode)
(diminish 'flyspell-mode)
(diminish 'git-gutter-mode)
(diminish 'anaconda-mode)


(provide 'init-modeline)
