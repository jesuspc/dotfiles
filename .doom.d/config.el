;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(map!
 "C-h" #'evil-window-left)
(map!
 "C-l" #'evil-window-right)
(map!
 "C-k" #'evil-window-up)
(map!
 "C-j" #'evil-window-down)

(unless (display-graphic-p)
        (require 'evil-terminal-cursor-changer)
        (evil-terminal-cursor-changer-activate) ; or (etcc-on)
        )

(setq evil-motion-state-cursor 'box)  ; █
(setq evil-visual-state-cursor 'box)  ; █
(setq evil-normal-state-cursor 'box)  ; █
(setq evil-insert-state-cursor 'bar)  ; ⎸
(setq evil-emacs-state-cursor  'hbar) ; _

(setq tide-server-max-response-length 10000000)

(setq company-idle-delay 0.5)

(xclip-mode t)

(after! lsp-ui
 (setq lsp-ui-sideline-enable nil))

;; (use-package! company-tabnine
;;   :after company
;;   :config
;;   (setq company-tabnine--disable-next-transform nil)
;;   (defun my-company--transform-candidates (func &rest args)
;;     (if (not company-tabnine--disable-next-transform)
;;         (apply func args)
;;       (setq company-tabnine--disable-next-transform nil)
;;       (car args)))

;;   (defun my-company-tabnine (func &rest args)
;;     (when (eq (car args) 'candidates)
;;       (setq company-tabnine--disable-next-transform t))
;;     (apply func args))

;;   (advice-add #'company--transform-candidates :around #'my-company--transform-candidates)
;;   (advice-add #'company-tabnine :around #'my-company-tabnine)
;;   (cl-pushnew 'company-tabnine (default-value 'company-backends))
;; )

