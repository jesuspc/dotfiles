;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     erc
     python
     octave
     slack
     yaml
     restclient
     auto-completion
     spotify
     better-defaults
     emacs-lisp
     osx
     fasd
     docker
     slack
     private-layer
     git
     github
     markdown
     pandoc
     shell
     search-engine
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'eshell)
     ; spell-checking
     syntax-checking
     version-control
     (haskell :variables
              haskell-enable-ghc-mod-support nil
              haskell-process-type 'stack-ghci
              haskell-completion-backend 'intero
              haskell-process-args-stack-ghci '("--ghc-options=-ferror-spans" "--with-ghc=intero")
              hindent-style  "johan-tibell"
              haskell-stylish-on-save t
              )
     ruby
     ruby-on-rails
     elixir
     erlang
     html
     javascript
     nlinum
     (osx :variables osx-use-option-as-meta nil)
     ranger
     ibuffer
     )
   dotspacemacs-additional-packages '(company-ghci scroll-restore litable wand highlight-indent-guides ob-restclient)
   dotspacemacs-excluded-packages '(linum-mode smooth-scrolling spaceline)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update t
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '(recents projects)
   dotspacemacs-startup-recent-list-size 5
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(monokai
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         zenburn)
   dotspacemacs-colorize-cursor-according-to-state nil
   dotspacemacs-default-font '("Fira Code";;"Hasklig";;"Source Code Pro"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab t
   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   dotspacemacs-which-key-delay 0.1
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native t
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers t
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  (setq-default evil-search-module 'evil-search
                js2-basic-offset 2
                js-indent-level 2
                evil-escape-key-sequence "jk"
                monokai-highlight-line "#3A3A3A"
                truncate-lines t
                )
  )

(defun dotspacemacs/user-config ()
  (setq ruby-insert-encoding-magic-comment nil)

  ;; Org-Capture
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
           "* TODO %?\n  %i\n  %a")
          ("j"
           "Link"
           entry
           (file+datetree "~/org/links.org")
           "* [[%^{Link}][%^{Description}]] %^g \n:PROPERTIES:\n:Created: %U\n:END:\n"
          )
         )
  )

  ;; Wand
  (require 'wand)
  (global-set-key (kbd "<C-return>") 'wand:execute)
  (global-set-key (kbd "<S-mouse-1>") 'wand:execute)

  (wand:add-rule-by-pattern :match "\\$ "
                            :capture :after
                            :action shell-command)

  (wand:add-rule-by-pattern :match "https?://"
                            :capture :whole
                            :action browse-url)

  ;; Enable multiple cursors
  (global-evil-mc-mode 1)
  (global-company-mode t)

  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(ruby-rubocop)))

  (setq ns-function-modifier 'hyper)

  ;; Haskell
  ;; (setq haskell-font-lock-symbols t)
  ;; (setq company-ghc-show-info t)

  ;;(add-to-list 'company-backends 'company-ghc)

  ;; Structured haskell
  ;; (add-to-list 'load-path "~/Code/haskell/structured-haskell-mode/elisp")
  ;; (require 'shm)
  ;; (set-face-background 'shm-current-face "#525252")
  ;; (define-key shm-map (kbd "M-s") 'shm/goto-parent-end)
  ;; (define-key shm-map (kbd "C-k") 'shm/delete-indentation)

  (add-hook 'haskell-mode-hook (lambda ()
                                 (message "haskell-mode-hook")
                                 (turn-on-haskell-indentation)
                                 (hindent-mode)
                                 (setq haskell-stylish-on-save t)
                                 (flycheck-add-next-checker 'intero '(warning . haskell-hlint))
                                 ))
  ;; (add-hook 'haskell-mode-hook 'structured-haskell-mode)

  ;; Org-mode
  (org-babel-do-load-languages
   'org-babel-load-languages '((haskell . t) (restclient . t)))
  (setq haskell-program-name "stack ghci")

  ;; Disables right alt bindings (needed in order to use hash and at symbols)
  (setq ns-right-alternate-modifier (quote none))
  (setq mac-option-modifier 'meta)

  (setq mouse-wheel-scroll-amount '(1 ((shift) . 4) ((control) . nil))) ;; mouse scroll moves 1 line at a time, instead of 5 lines
  (setq mouse-wheel-progressive-speed nil) ;; on a long mouse scroll keep scrolling by 1 line

  (add-hook 'text-mode-hook 'auto-fill-mode)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  ;; (add-hook 'alchemist-mode-hook 'company-mode)

  ;; (defun custom-alchemist-hook ()
  ;;   (set (make-local-variable 'company-backends) '(alchemist-company)))
  (add-to-list 'company-backends 'alchemist-company)

  ;;(add-hook 'alchemist-mode-hook  'custom-alchemist-hook)

  ;; Fill column
  ;; (setq fci-rule-color "#75715F")
  ;; (add-hook 'prog-mode-hook 'spacemacs/toggle-fill-column-indicator-on)

  ;; Indent guide
  (setq indent-guide-recursive t)
  (setq indent-guide-char "│" )
  (setq indent-guide-delay nil)
  ;; (add-hook 'prog-mode-hook 'spacemacs/toggle-indent-guide-on)
  ;; Indentation through highlight-indent-guides
  (require 'highlight-indent-guides)
  (setq highlight-indent-guides-method 'character)
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  (add-hook 'prog-mode-hook 'centered-cursor-mode)
  (add-hook 'text-mode-hook 'centered-cursor-mode)

  ;; Custom key bindings
;;; esc quits
  (defun minibuffer-keyboard-quit ()
    "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
    (interactive)
    (if (and delete-selection-mode transient-mark-mode mark-active)
        (setq deactivate-mark  t)
      (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
      (abort-recursive-edit)))
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
  (define-key evil-normal-state-map (kbd "<escape>") '(lambda ()
                                                        (interactive)
                                                        (spacemacs/evil-search-clear-highlight)
                                                        (evil-mc-undo-all-cursors)
                                                        (keyboard-quit)))
  (define-key evil-insert-state-map (kbd "C-a") 'evil-first-non-blank)
  (define-key evil-insert-state-map (kbd "C-e") 'evil-last-non-blank)
  (define-key evil-normal-state-map (kbd "H-SPC") 'set-rectangular-region-anchor)
  (define-key evil-normal-state-map (kbd "SPC SPC") 'evil-avy-goto-char)

  ;; Disable smartparens highlighting
  ;(with-eval-after-load 'smartparens
  ;  (show-smartparens-global-mode -1))

  (global-set-key (kbd "M-+") 'text-scale-increase)
  (global-set-key (kbd "M--") 'text-scale-decrease)
  ;; Horizontal scrolling
  (global-set-key (kbd "<wheel-right>") '(lambda ()
                                           (interactive)
                                           (scroll-left 4)))
  (global-set-key (kbd "<wheel-left>") '(lambda ()
                                          (interactive)
                                          (scroll-right 4)))

  ; So iex would have a working history
  (when (require 'term nil t)

    (defun term-handle-ansi-terminal-messages (message)
      (while (string-match "\eAnSiT.+\n" message)
        ;; Extract the command code and the argument.
        (let* ((start (match-beginning 0))
               (command-code (aref message (+ start 6)))
               (argument
                (save-match-data
                  (substring message
                             (+ start 8)
                             (string-match "\r?\n" message
                                           (+ start 8))))))
          ;; Delete this command from MESSAGE.
          (setq message (replace-match "" t t message))

          (cond ((= command-code ?c)
                 (setq term-ansi-at-dir argument))
                ((= command-code ?h)
                 (setq term-ansi-at-host argument))
                ((= command-code ?u)
                 (setq term-ansi-at-user argument))
                ((= command-code ?e)
                 (save-excursion
                   (find-file-other-window argument)))
                ((= command-code ?x)
                 (save-excursion
                   (find-file argument))))))

      (when (and term-ansi-at-host term-ansi-at-dir term-ansi-at-user)
        (setq buffer-file-name
              (format "%s@%s:%s" term-ansi-at-user term-ansi-at-host term-ansi-at-dir))
        (set-buffer-modified-p nil)
        (setq default-directory (if (string= term-ansi-at-host (system-name))
                                    (concatenate 'string term-ansi-at-dir "/")
                                  (format "/%s@%s:%s/" term-ansi-at-user term-ansi-at-host term-ansi-at-dir)))
        (setq truncated-dir-name (truncate-dir-name default-directory)))

      message))

  (defun term-send-up    () (interactive) (term-send-raw-string "\e[A"))
  (defun term-send-down  () (interactive) (term-send-raw-string "\e[B"))
  (defun term-send-right () (interactive) (term-send-raw-string "\e[C"))
  (defun term-send-left  () (interactive) (term-send-raw-string "\e[D"))

  (global-set-key [s-left] 'windmove-left)
  (global-set-key [s-right] 'windmove-right)
  (global-set-key [s-up] 'windmove-up)
  (global-set-key [s-down] 'windmove-down)

  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-eslint)))

  ;; Robot mode
  ;; (load-file "/Users/jesuscolomina/robot-mode.el")
  ;; (add-to-list 'auto-mode-alist '("\\.txt\\'" . robot-mode))
  ;; Robot tab offset
  (setq c-basic-offset 2)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(evil-want-Y-yank-to-eol t)
 '(fci-rule-color "#073642" t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic ob-restclient spinner bind-map highlight-indent-guides wand ob-elixir minitest hide-comnt org erlang litable restclient ob-http yaml-mode smooth-scroll pug-mode slack emojify circe oauth2 websocket dockerfile-mode docker tablist docker-tramp fasd grizzl spotify helm-spotify multi magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito pcache stickyfunc-enhance srefactor ibuffer-projectile flyspell-correct-helm flyspell-correct auto-dictionary zenburn-theme solarized-theme ranger fcitx pangu-spacing find-by-pinyin-dired chinese-pyim chinese-pyim-basedict ace-pinyin pinyinlib ace-jump-mode pandoc-mode ox-pandoc ht scroll-restore hlint-refactor helm-hoogle uuidgen osx-dictionary org-projectile org-download nlinum-relative nlinum mwim livid-mode skewer-mode simple-httpd link-hint git-link flycheck-mix eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff eshell-z dumb-jump column-enforce-mode request xterm-color window-numbering web-mode toc-org ruby-test-mode rspec-mode projectile-rails rake f persp-mode page-break-lines orgit org-pomodoro alert org-plus-contrib neotree multi-term markdown-toc markdown-mode magit-gitflow leuven-theme less-css-mode json-mode js-doc intero info+ hl-todo hindent highlight-numbers helm-swoop helm-projectile helm-make projectile helm-descbinds helm-c-yasnippet helm-ag google-translate gitconfig-mode git-messenger feature-mode expand-region exec-path-from-shell evil-mc evil-matchit evil-magit magit magit-popup evil-exchange eshell-prompt-extras diff-hl company-tern dash-functional tern company-quickhelp coffee-mode bundler buffer-move auto-yasnippet auto-compile ace-link auto-complete avy elixir-mode ghc anzu iedit smartparens highlight haskell-mode flycheck git-gutter git-commit with-editor company helm popup helm-core async yasnippet multiple-cursors js2-mode hydra inf-ruby dash s quelpa package-build use-package which-key evil spacemacs-theme ws-butler web-beautify volatile-highlights vi-tilde-fringe undo-tree tagedit smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-end rubocop robe reveal-in-osx-finder restart-emacs rbenv rainbow-delimiters popwin pcre2el pbcopy parent-mode paradox packed osx-trash org-repo-todo org-present org-bullets open-junk-file move-text mmm-mode macrostep lorem-ipsum log4e linum-relative launchctl json-snatcher json-reformat js2-refactor jade-mode inflections indent-guide ido-vertical-mode hungry-delete htmlize highlight-parentheses highlight-indentation help-fns+ helm-themes helm-mode-manager helm-gitignore helm-flx helm-css-scss helm-company haskell-snippets goto-chg golden-ratio gnuplot gntp gitattributes-mode git-timemachine git-gutter-fringe git-gutter-fringe+ gh-md flycheck-pos-tip flycheck-haskell flx-ido fill-column-indicator fancy-battery evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-lisp-state evil-indent-plus evil-iedit-state evil-escape evil-args evil-anzu eval-sexp-fu esh-help engine-mode emmet-mode elisp-slime-nav diminish define-word company-web company-statistics company-ghci company-ghc company-cabal cmm-mode clean-aindent-mode chruby bracketed-paste bind-key auto-highlight-symbol alchemist aggressive-indent adaptive-wrap ace-window ace-jump-helm-line ac-ispell)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))

(when (window-system)
  (set-default-font "Fira Code"))
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               ;; (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))
