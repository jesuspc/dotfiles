;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)

(package! evil-terminal-cursor-changer)
;; (package! company-tabnine)
;;
(package! ts
  :recipe (:host github :repo "alphapapa/ts.el" :branch "master" :files ("*.el")))
