(in-package :cl-user)
(defpackage clack-static-asset-middleware-test
  (:use :cl
        :clack-static-asset-middleware
        :prove))
(in-package :clack-static-asset-middleware-test)

;; NOTE: To run this test file, execute `(asdf:test-system :clack-static-asset-middleware)' in your Lisp.

(plan 3)

(subtest "MD5 Files"
  (is (clack-static-asset-middleware::md5-file (asdf:system-relative-pathname :clack-static-asset-middleware-test "t/assets/potato.txt"))
      "f7cd4ebd7c09e497bd3f7da2ab4451e7")

    (is (clack-static-asset-middleware::md5-file (asdf:system-relative-pathname :clack-static-asset-middleware-test "t/assets/images/gustywinds.jpg"))
      "2867f3f83a6a91ad4a19a6cd45536152"))

(subtest "File filters"

  (ok (not (funcall clack-static-asset-middleware::*default-filter-function* (pathname #P"/home/user/file.txt")))
      "Non-dotted files allowed.")
  (ok (funcall clack-static-asset-middleware::*default-filter-function* (pathname #P"/home/user/.file.txt"))
      "Dotted files are filtered."))

(subtest "Relative pathnames"

  (let ((root (pathname #P"/var/www/assets/")))
    (is (clack-static-asset-middleware::root-relative-path (pathname #P"/var/www/assets/potato.jpg") root)
        "potato.jpg")

    (is (clack-static-asset-middleware::root-relative-path (pathname #P"/var/www/assets/styles/best-assets.css") root)
        "styles/best-assets.css")))

(finalize)
