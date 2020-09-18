;;; init.el -*- coding: utf-8; lexical-binding: t; -*-

(let* ((minver "27.1"))
  (when (version< emacs-version minver)
    (error "Emacs v%s or higher is required." minver)))

(setq emacs-load-start-time (current-time))
(setq user-emacs-directory (file-name-directory load-file-name))

;; Load emacs libraries from ~/.emacs.d/lisp directory
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; A big contributor to startup times is garbage collection. We up the gc
;; threshold to temporarily prevent it from running, then reset it later by
;; enabling `gcmh-mode'. Not resetting it will cause stuttering/freezes.
(setq gc-cons-threshold most-positive-fixnum)


;; In noninteractive sessions, prioritize non-byte-compiled source files to
;; prevent the use of stale byte-code. Otherwise, it saves us a little IO time
;; to skip the mtime checks on every *.elc file.
(setq load-prefer-newer noninteractive)


;; @see https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
;; Normally file-name-handler-alist is set to
;; (("\\`/[^/]*\\'" . tramp-completion-file-name-handler)
;; ("\\`/[^/|:][^/|]*:" . tramp-file-name-handler)
;; ("\\`/:" . file-name-non-special))
;; Which means on every .el and .elc file loaded during start up, it has to runs those regexps against the filename.
(let* ((file-name-handler-alist nil))
  ;; Ensure Doom is running out of this file's directory

  ;; ;; {{
  ;; (require 'benchmark-init-modes)
  ;; (require 'benchmark-init)
  ;; (benchmark-init/activate)
  ;; ;; `benchmark-init/show-durations-tree' to show benchmark result
  ;; ;; }}

  ;; Bootstrap straight.el
  (require 'straight (concat user-emacs-directory "straight.el"))

  ;; Load rest of the libraries
  (require 'init-ui)
  (require 'init-ux)
  (require 'init-ediff))

;; For now instead of gchm, reset manually
(setq best-gc-cons-threshold (* 64 1024 1024))
(setq gc-cons-threshold best-gc-cons-threshold)

(when (require 'time-date nil t)
  (message "Emacs startup time: %d seconds."
           (time-to-seconds (time-since emacs-load-start-time))))

;;; no-byte-compile: t
;;; End:
(put 'erase-buffer 'disabled nil)
