;;emacs参数
;; -nw 不使用图形界面 -no-window
;; -q  不加载配置文件
;; --debug-init

;;;; 添加Emacs搜索路径
(add-to-list 'load-path "~/_emacs")
;;(add-to-list 'load-path "~/install/ecb-2.40")
(add-to-list 'load-path "~/install/ecb-alexott")
(add-to-list 'load-path "~/_emacs/codepilot")
(add-to-list 'load-path "~/_emacs/emacs-eclim")
(add-to-list 'load-path "~/_emacs/icicles")
(add-to-list 'load-path "~/_emacs/gnuserv")

;;模板功能
(add-to-list 'load-path "~/install/yasnippet-0.6.1c")
;;自动补全
(add-to-list 'load-path "~/install/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/install/auto-complete-1.3.1/dict")
(ac-config-default)

;;;;读取脚本
(load "base.el")
(load "cyexpand.el")
(load "cykbd.el")
(load "addon.el")
(load "cedet-bzr-settings.el")
;;(load "cedet-settings.el")
;;为了编程的配置
(load "cycode.el")

(require 'smex);
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(load "projects.el")
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cc-search-directories (quote ("." "/usr/include" "/usr/local/include/*" "/usr/lib/syslinux/com32/include" "/usr/lib/gcc/x86_64-linux-gnu/4.6/include" "/usr/lib/gcc/x86_64-linux-gnu/4.6/include-fixed/" "/usr/include/x86_64-linux-gnu/" "/usr/include/c++/4.6/" "/usr/include/c++/4.6/x86_64-linux-gnu/" "/usr/include/c++/4.6/backward/" "/usr/lib/syslinux/com32/include/")))
 '(column-number-mode t)
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(ede-project-directories (quote ("/tmp/myproject/include" "/tmp/myproject/src" "/tmp/myproject")))
 '(mouse-1-click-in-non-selected-windows t)
 '(mouse-drag-copy-region t)
 '(mouse-yank-at-point t)
 '(save-place t nil (saveplace))
 '(semanticdb-project-roots (quote ("~/Linear_transcoder_41")))
 '(show-paren-mode t)
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(compilation-info ((((type tty)) :bold t :foreground "green") (t :foreground "green")))
 '(compilation-warning ((((class color)) :foreground "red" :bold nil)))
 '(completions-first-difference ((((class color) (background dark)) (:foreground "red"))))
 '(eldoc-highlight-function-argument ((((type tty)) :bold t :foreground "green") (t :bold nil :foreground "green")))
 '(font-lock-comment-delimiter-face ((((type tty)) :bold t :foreground "red") (t :foreground "chocolate1")))
 '(font-lock-constant-face ((((type tty)) :bold t :background "white" :foreground "blue") (t :background "darkslateblue" :foreground "chartreuse")))
 '(font-lock-doc-face ((((type tty)) :foreground "green") (t (:foreground "maroon1"))))
 '(font-lock-function-name-face ((((type tty)) :bold t :background "yellow" :foreground "blue") (t :background "#45D463DD4FF8" :foreground "yellow")))
 '(font-lock-regexp-grouping-backslash ((((type tty)) :foreground "red") (t (:foreground "red"))))
 '(font-lock-regexp-grouping-construct ((((type tty)) :foreground "yellow") (t (:foreground "yellow"))))
 '(font-lock-type-face ((((type tty)) :bold t :foreground "green") (t (:foreground "green"))))
 '(font-lock-warning-face ((t (:background "red" :foreground "white"))))
 '(header-line ((default :inherit mode-line) (((type tty)) :foreground "black" :background "yellow" :inverse-video nil) (((class color grayscale) (background light)) :background "grey90" :foreground "grey20" :box nil) (((class color grayscale) (background dark)) :background "#D58EFFFFFC18" :foreground "blue") (((class mono) (background light)) :background "white" :foreground "black" :inverse-video nil :box nil :underline t) (((class mono) (background dark)) :background "black" :foreground "white" :inverse-video nil :box nil :underline t)))
 '(highlight-symbol-face ((((type tty)) :background "white" :foreground "black") (((class color) (background dark)) :background "gray30" :foreground "#AD0DE2FAFFFF") (((class color) (background light)) :background "gray90")))
 '(ido-first-match ((((type tty pc)) :foreground "yellow") (t :bold nil :foreground "yellow")))
 '(ido-only-match ((((class color)) (:bold nil :foreground "green"))))
 '(info-header-node ((((class color) (background dark)) (:foreground "red"))))
 '(info-menu-header ((((type tty pc)) :underline t :weight bold) (t :inherit nil :foreground "coral2" :bold nil)))
 '(info-quoted-name ((((type tty)) :bold t :foreground "green") (t :foreground "cornflower blue")))
 '(info-reference-item ((((type tty pc)) :background "white" :foreground "black") (t :background "white" :foreground "cornflower blue")))
 '(info-title-1 ((((type tty pc) (class color) (background dark)) :foreground "yellow" :weight bold) (t :foreground "yellow")))
 '(info-title-2 ((((type tty pc) (class color) (background dark)) :foreground "yellow" :weight bold) (t :foreground "lightblue")))
 '(info-title-3 ((((type tty pc) (class color) (background dark)) :foreground "yellow" :weight bold) (t :foreground "violetred1")))
 '(info-title-4 ((((type tty pc) (class color) (background dark)) :foreground "yellow" :weight bold) (t :foreground "green")))
 '(info-xref ((((type tty)) :inherit link) (t :foreground "#165ACBD1FFFF" :underline t)))
 '(isearch-fail ((((class color)) (:background "red"))))
 '(linum ((((background dark)) :foreground "cyan") (t :foreground "gray")))
 '(match ((((class color) (min-colors 88) (background light)) :background "yellow1") (((class color) (min-colors 88) (background dark)) :background "RoyalBlue3" :foreground "cyan") (((class color) (min-colors 8) (background light)) :background "yellow" :foreground "black") (((class color) (min-colors 8) (background dark)) :background "blue" :foreground "white") (((type tty) (class mono)) :inverse-video t) (t :background "gray")))
 '(moccur-face ((((type tty)) :bold t :foreground "red") (t :bold nil :foreground "red")))
 '(mode-line-buffer-id ((((class grayscale) (background light)) (:foreground "LightGray" :background "yellow" :weight bold)) (((class grayscale) (background dark)) (:foreground "DimGray" :background "yellow" :weight bold)) (((class color) (min-colors 88) (background light)) (:foreground "Orchid" :background "yellow")) (((class color) (min-colors 88) (background dark)) (:foreground "yellow" :background "HotPink3")) (((class color) (min-colors 16) (background light)) (:foreground "Orchid" :background "yellow")) (((class color) (min-colors 16) (background dark)) (:foreground "LightSteelBlue" :background "yellow")) (((class color) (min-colors 8)) (:foreground "blue" :background "yellow" :weight bold)) (t (:weight bold))))
 '(pulse-highlight-start-face ((((class color) (min-colors 88) (background dark)) :background "#AAAA33") (((class color) (min-colors 88) (background light)) :background "#FFFFAA") (((class color) (min-colors 8)) :background "blue" :foreground "red")))
 '(region ((((class color) (min-colors 88) (background dark)) :background "#4CAA4CAA4CAA") (((class color) (min-colors 88) (background light)) :background "lightgoldenrod2") (((class color) (min-colors 16) (background dark)) :background "wheat") (((class color) (min-colors 16) (background light)) :background "lightgoldenrod2") (((class color) (min-colors 8)) :background "blue" :foreground "red") (((type tty) (class mono)) :inverse-video t) (t :background "gray")))
 '(semantic-highlight-func-current-tag-face ((((type tty)) nil) (((class color) (background dark)) (:background "gray20")) (((class color) (background light)) (:background "gray90"))))
 '(zjl-elisp-hl-function-call-face ((((class grayscale) (background light)) :foreground "LightGray" :weight bold) (((class grayscale) (background dark)) :foreground "DimGray" :weight bold) (((class color) (min-colors 88) (background light)) :foreground "Orchid") (((class color) (min-colors 88) (background dark)) :foreground "cornflower blue") (((class color) (min-colors 16) (background light)) :foreground "Orchid") (((class color) (min-colors 16) (background dark)) :foreground "LightSteelBlue") (((class color) (min-colors 8)) (:foreground "blue" :weight bold)) (t (:weight bold))))
 '(zjl-hl-function-call-face ((((class grayscale) (background light)) :foreground "LightGray" :weight bold) (((class grayscale) (background dark)) :foreground "DimGray" :weight bold) (((class color) (min-colors 88) (background light)) :foreground "Orchid") (((class color) (min-colors 88) (background dark)) :foreground "cornflower blue") (((class color) (min-colors 16) (background light)) :foreground "Orchid") (((class color) (min-colors 16) (background dark)) :foreground "LightSteelBlue") (((class color) (min-colors 8)) (:foreground "blue" :weight bold)) (t (:weight bold)))))
