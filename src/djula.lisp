(in-package :cl-user)
(defpackage clack-static-asset-middleware-djula
  (:use #:cl
        #:clack-static-asset-middleware))

(in-package :clack-static-asset-middleware-djula)

(djula::def-tag-compiler :stylesheet-tag (path)
  (lambda (stream)
    (format stream "<link rel=\"stylesheet\" src=\"~a\">" (busted-uri-for-path path))))

;; http://guides.rubyonrails.org/asset_pipeline.html
(djula::def-tag-compiler :asset-path (path)
  (lambda (stream)
    (princ (busted-uri-for-path path) stream)))