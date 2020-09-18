;;; init-ui.el -*- coding: utf-8; lexical-binding: t; -*-

;;; Theme
(straight-use-package 'leuven-theme)

(load-theme 'leuven t)

;; In leuven, fontify the whole line for headings (with a background color).
(setq org-fontify-whole-heading-line t)

;;; Font


;;; Cursor

;; The blinking cursor is distracting, but also interferes with cursor settings
;; in some minor modes that try to change it buffer-locally (like treemacs) and
;; can cause freezing for folks (esp on macOS) with customized & color cursors.
(blink-cursor-mode -1)

;; Don't blink the paren matching the one at point, it's too distracting.
(setq blink-matching-paren nil)

;; Don't stretch the cursor to fit wide characters, it is disorienting,
;; especially for tabs.
(setq x-stretch-cursor nil)


;;; Fringes

;; Reduce the clutter in the fringes; we'd like to reserve that space for more
;; useful information, like git-gutter and flycheck.
(setq indicate-buffer-boundaries nil
      indicate-empty-lines nil)


;;; Bars and Dialogs

;; These are disabled directly through their frame parameters, to avoid the
;; extra work their minor modes do, but we have to unset these variables
;; ourselves, otherwise users will have to cycle them twice to re-enable them.
(setq menu-bar-mode nil
      tool-bar-mode nil
      scroll-bar-mode nil)

;; always avoid GUI
(setq use-dialog-box nil)

;; Don't display floating tooltips; display their contents in the echo-area,
;; because native tooltips are ugly.
(when (bound-and-true-p tooltip-mode)
  (tooltip-mode -1))

(provide 'init-ui)
