;;; init-spelling.el -*- coding: utf-8; lexical-binding: t; -*-

(require 'flyspell)

(setq ispell-program-name "aspell" ; use aspell instead of ispell
      ispell-extra-args '("--sug-mode=ultra"))

(defun prelude-enable-flyspell ()
  "Enable command `flyspell-mode' if `prelude-flyspell' is not nil."
  (when (executable-find ispell-program-name)
    (flyspell-mode t)))

;; Enable spell
(add-hook 'text-mode-hook 'prelude-enable-flyspell)
;; Add spell-checking in comments for all programming language modes
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(provide 'init-spelling)
