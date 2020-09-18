;;; init-ediff.el -*- coding: utf-8; lexical-binding: t; -*-


(defun ediff-startup-hook-setup ()
  ;; hide control panel if it's current buffer
  (when (string-match-p "\*Ediff Control Panel.*\*" (buffer-name))
    ;; load color theme for merge
    (load-theme 'tango t)
    ;; show only clashed area
    (ediff-toggle-show-clashes-only)
    ;; move to the first difference
    (ediff-next-difference)))

(defun ediff-copy-both-to-C ()
  (interactive)
  (ediff-copy-diff ediff-current-difference nil 'C nil
                   (concat
                    (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
                    (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer))))

(defun add-d-to-ediff-mode-map () (define-key ediff-mode-map "d" 'ediff-copy-both-to-C))
(add-hook 'ediff-keymap-setup-hook 'add-d-to-ediff-mode-map)

(add-hook 'ediff-startup-hook 'ediff-startup-hook-setup)

(provide 'init-ediff)
