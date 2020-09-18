;;; init-company.el -*- coding: utf-8; lexical-binding: t; -*-

(add-hook 'after-init-hook 'global-company-mode)

(global-set-key (kbd "TAB") #'company-indent-or-complete-common)

(provide 'init-company)
