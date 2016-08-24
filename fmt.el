  (setq-default indent-tabs-mode nil)
  (setq require-final-newline 'visit-save)
  (setq-default require-final-newline 'visit-save)
(load "erlang-start")
(require 'cl)

(defun indent ()
  (erlang-indent-current-buffer)
  )

(defun fmt-file (arg)
  (message "fmt %s" arg)
  (setq require-final-newline 'visit-save)
  (setq-default require-final-newline 'visit-save)
  (find-file arg)
  (setq require-final-newline 'visit-save)
  (setq-default require-final-newline 'visit-save)
  (erlang-mode)
  (setq require-final-newline 'visit-save)
  (setq-default require-final-newline 'visit-save)
  ;; (toggle-debug-on-error)
  (untabify (point-min) (point-max))
  (condition-case ex
      (indent)
    ('error (message "%s" (error-message-string ex)))
    )
  (setq require-final-newline 'visit-save)
  (setq-default require-final-newline 'visit-save)
  (save-buffer)
  (setq require-final-newline 'visit-save)
  (setq-default require-final-newline 'visit-save)
  (kill-buffer)
  )

(cl-mapc 'fmt-file command-line-args-left)
