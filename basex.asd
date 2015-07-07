(in-package :cl-user)
(asdf:defsystem :basex
  :version 1.0
  :description "module to handle basex(like base62)."
  :author "d.n. <strobolights@gmail.com>"
  ;; :depends-on (:cl-ppcre :series :trees)
  :components
  ((:file "pkg")
   (:file "basex" :depends-on ("pkg"))
   ))
  
