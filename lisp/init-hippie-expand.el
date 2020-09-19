;; -*- coding: utf-8; lexical-binding: t; -*-

(global-set-key (kbd "M-/") 'hippie-expand)

;; hippie expand is dabbrev expand on steroids
;; Since we got company-ispell and `M-x toggle-company-ispell'
;; Done, now we just use it as a clause in our make-hippie-expand-function (as above)
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

(provide 'init-hippie-expand)
