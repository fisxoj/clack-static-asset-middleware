(in-package :cl-user)
(defpackage clack-static-asset-middleware
  (:use :cl))
(in-package :clack-static-asset-middleware)

(defparameter *default-filter-function*
  (lambda (p) (char= (char (pathname-name p) 0) #\.))
  "Function to filer out files that would be hidden on a unix system.  Namely, anything that starts with a `#\.`.")

(defun md5-file (pathname &key buffer digest)
  "Generate a string of hex digits for a given pathname."
  (ironclad:byte-array-to-hex-string (ironclad:digest-file :md5 pathname :buffer buffer :digest digest)))

(defun root-relative-path (pathname root)
  "Produces a relative pathname relative to the root of the asset directory.  The string that might be specified in a template, for example."
  (subseq (uiop:native-namestring pathname) (length (uiop:native-namestring root))))

(defun inventory-files (pathnames hash-storage root &key (filter-function *default-filter-function*))
  (loop
     for p in pathnames
     for root-relative-path = (root-relative-path p root)
     unless (funcall filter-function p)
     do (setf (gethash root-relative-path hash-storage) (md5-file p))))


(defparameter *clack-static-asset-middleware*
  (lambda (app &key (cache-busting t) path (root #P"./"))

    (lambda (env)

      )))
