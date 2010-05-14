;; hungry-delete.el - hungry delete minor mode
;;
;; Copyright (C) 2009 Nathaniel Flath <nflath@gmail.com>
;; Version: 0.1
;;
;; Commentary:
;;
;; This will insert { with the formatting I want.
;;
;; To use this mode, just put the following in your .emacs file:
;;
;; (require 'brace-mirror)
;;
;; And add brace-mirror-mode to any hooks you wish.
;; Code:

(defvar brace-mirror-mode-map (make-keymap)
  "Keymap for mirror-mode.")

(define-key brace-mirror-mode-map (read-kbd-macro "{")  'brace-mirror-insert-open-brace)

(define-minor-mode brace-mirror-mode
  "Mirrors insertion of {."
  :init-value nil
  :global t
  :group 'brace-mirror-mode)

(defun brace-mirror-insert-open-brace (&optional arg)
  (interactive)
  (if (or (equal (face-at-point) font-lock-doc-face)
          (equal (face-at-point) font-lock-string-face)
          (equal (face-at-point) font-lock-comment-face))
      (self-insert-command)
    (insert "{")
    (newline-and-indent)
    (newline-and-indent)
    (insert "}")
    (indent-according-to-mode)
    (previous-line)
    (back-to-indentation)))

(provide 'brace-mirror)