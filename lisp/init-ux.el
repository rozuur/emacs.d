;;; init-ux.el -*- coding: utf-8; lexical-binding: t; -*-

;; Setup uniquify so that non-unique buffer names get the parent path
;; included to make them unique.
(setq uniquify-buffer-name-style 'forward
      ;; no beeping or blinking please
      ring-bell-function #'ignore
      visible-bell nil)

;; middle-click paste at point, not at click
(setq mouse-yank-at-point t)


;;; Scrolling
(setq hscroll-margin 2
      hscroll-step 1
      ;; Emacs to fully redraw the display before it processes queued input events
      redisplay-dont-pause t
      ;; Emacs spends too much effort recentering the screen if you scroll the
      ;; cursor more than N lines past window edges (where N is the settings of
      ;; `scroll-conservatively'). This is especially slow in larger files
      ;; during large-scale scrolling commands. If kept over 100, the window is
      ;; never automatically recentered.
      scroll-conservatively 1001
      scroll-margin 0
      scroll-preserve-screen-position t
      ;; Reduce cursor lag by a tiny bit by not auto-adjusting `window-vscroll'
      ;; for tall lines.
      auto-window-vscroll nil
      ;; mouse
      mouse-wheel-scroll-amount '(5 ((shift) . 2))
      mouse-wheel-progressive-speed nil)  ; don't accelerate scrolling

;; Remove hscroll-margin in shells, otherwise it causes jumpiness
(add-hook 'eshell-mode-hook (lambda () (hscroll-margin 0)))
(add-hook 'term-mode-hook (lambda () (hscroll-margin 0)))

;;; Parens

(add-hook 'after-init-hook 'show-paren-mode)

(setq show-paren-delay 0.1
      show-paren-highlight-openparen t
      show-paren-when-point-inside-paren t
      show-paren-when-point-in-periphery t)

;; Show trailing whitespace
(setq show-trailing-whitespace t)
;; Delete trailing whitespace when saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

(provide 'init-ux)
