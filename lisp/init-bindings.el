;;; init-bindings.el -*- coding: utf-8; lexical-binding: t; -*-

;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; replace zap-to-char functionality with the more powerful zop-to-char
(global-set-key [remap zap-to-char] 'zop-up-to-char)

;; Use crux for better line editing
(global-set-key [remap move-beginning-of-line] #'crux-move-beginning-of-line)
(global-set-key [remap open-line] #'crux-smart-open-line)
(global-set-key [remap kill-line] #'crux-smart-kill-line)
(global-set-key [remap kill-whole-line] #'crux-kill-whole-line)

;; Better window navigation using ace-window
(global-set-key [remap other-window] 'ace-window)

;; replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)


(provide 'init-bindings)
