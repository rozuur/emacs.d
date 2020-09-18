;;; init-ediff.el -*- coding: utf-8; lexical-binding: t; -*-


(defun ediff-startup-hook-setup ()
  ;; hide control panel if it's current buffer
  (when (string-match-p "\*Ediff Control Panel.*\*" (buffer-name))
    ;; Ignore whitespace
    (setq ediff-diff-options "-w")
    ;; show only clashed area
    (ediff-toggle-show-clashes-only)
    ;; move to the first difference
    (ediff-next-difference)))

(add-hook 'ediff-startup-hook 'ediff-startup-hook-setup)


;; https://stackoverflow.com/a/29757750/281402
;; Create a merge with a copy of both differences
(defun ediff-copy-both-to-C ()
  (interactive)
  (ediff-copy-diff ediff-current-difference nil 'C nil
                   (concat
                    (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
                    (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer))))

;; And press 'c' to activate the merge
(defun add-c-to-ediff-mode-map () (define-key ediff-mode-map "c" 'ediff-copy-both-to-C))
(add-hook 'ediff-keymap-setup-hook 'add-c-to-ediff-mode-map)


(provide 'init-ediff)
