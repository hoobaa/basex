(in-package :basex)

(defvar basex-chars)
(defvar baasex)
(defvar char-to-index)

(defvar basex-default-chars "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "base62 is default")
(defun basex-set-chars ( &optional (chars basex-default-chars) )
  (setf basex-chars chars)
  (setf basex (length chars))
  (setf char-to-index (make-hash-table))
  (loop for i from 0 below basex
        do (setf (gethash (char basex-chars i) char-to-index) i)))

(basex-set-chars)

(defun basex-encode (val)
  (if (= 0 val)
      "0"
    (coerce
     (reverse
      (loop for v = val then (floor (/ v basex))
            for char = (char basex-chars (mod v basex))
            while (< 0 v)
            collect char
            ;;collect (char "aaa" 0)
            ))
     'string
     )))

(defun basex-decode (val &aux (dval 0))
  (loop for char across (reverse val)
        for i from 0
        do (incf
            dval
            (* (gethash char char-to-index)
             (expt basex i))))
  dval)
