;;; init-ui.el -*- coding: utf-8; lexical-binding: t; -*-

;;; Theme


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

;; Don't resize windows & frames in steps; it's prohibitive to prevent the user
;; from resizing it to exact dimensions, and looks weird.
(setq window-resize-pixelwise t
      frame-resize-pixelwise t)

;; Some terminals offer two different cursors: a "visible" static cursor and a
;; "very visible" blinking one. By default, Emacs uses the very visible cursor
;; and will switch back to it when Emacs is started or resumed. A nil
;; `visible-cursor' prevents this.
(setq visible-cursor nil)

;; Enable the mouse in terminal Emacs
(add-hook 'tty-setup-hook #'xterm-mouse-mode)

;;; Fringes

;; Reduce the clutter in the fringes; we'd like to reserve that space for more
;; useful information, like git-gutter and flycheck.
(setq indicate-buffer-boundaries nil
      indicate-empty-lines nil)


;; The native border "consumes" a pixel of the fringe on righter-most splits,
;; `window-divider' does not. Available since Emacs 25.1.
(setq window-divider-default-places t
      window-divider-default-bottom-width 1
      window-divider-default-right-width 1)
(add-hook 'doom-init-ui-hook #'window-divider-mode)


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
