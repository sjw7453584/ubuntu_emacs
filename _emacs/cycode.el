;;==============================================================
;;gdb-UI配置
;;==============================================================
(setq gdb-many-windows t)
(load-library "multi-gud.el")
(load-library "multi-gdb-ui.el")

;;==================================================
;;cedet插件设置
;;==================================================
;;(add-to-list 'load-path "~/install/cedet-1.0/speedbar")
;;(add-to-list 'load-path "~/install/cedet-1.0/eieio")
;;(add-to-list 'load-path "~/install/cedet-1.0/semantic")
;; Load CEDET.,从cedet的INSTALL中复制过来的
;; See cedet/common/cedet.info for configuration details.
;;(load-file "~/install/cedet-1.0/common/cedet.el")
;;(semantic-add-system-include "/usr/include/" 'c++-mode)
;; Enable EDE (Project Management) features

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
;;(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
;;(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberent ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)
;;   Or, use one of these two types of support.
;;   Add support for new languges only via ctags.
;; (semantic-load-enable-primary-exuberent-ctags-support)
;;   Add support for using ctags as a backup parser.
;; (semantic-load-enable-secondary-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
 ;;(global-srecode-minor-mode 1)
 
 ;;----------------------------------------------------------------------
;; (semantic-load-enable-minimum-features)
;;(semantic-load-enable-code-helpers)
;;(semantic-load-enable-guady-code-helpers)
;;(semantic-load-enable-excessive-code-helpers)
;;(semantic-load-enable-semantic-debugging-helpers)

;;(global-ede-mode t)
;; (global-semantic-decoration-mode t)
;; (global-semantic-highlight-func-mode t)
;; (global-semantic-show-unmatched-syntax-mode t)

;;代码折叠
;;(require 'semantic-tag-folding nil 'noerror)
;;(global-semantic-tag-folding-mode 1)
;;折叠和打开整个buffer的所有代码
;;(define-key semantic-tag-folding-mode-map (kbd "C--") 'semantic-tag-folding-fold-all)
;;(define-key semantic-tag-folding-mode-map (kbd "C-=") 'semantic-tag-folding-show-all)
;;折叠和打开单个buffer的所有代码
;;(define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-block)
;;(define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-block)


;; ;; Semantic

;; (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
;;                                   global-semanticdb-minor-mode
;; 								  global-cedet-m3-minor-mode
;; 								  global-semantic-highlight-func-mode
;; 								  global-semantic-decoration-mode
;; 								  global-semantic-idle-local-symbol-highlight-mode
;;                                   global-semantic-idle-summary-mode
;;                                   global-semantic-mru-bookmark-mode))
;; (require 'semantic/ia)
;; (require 'semantic/bovine/gcc)

;; (defun my-c-mode-cedet-hook ()
;;  (local-set-key "." 'semantic-complete-self-insert)
;;  (local-set-key ">" 'semantic-complete-self-insert))
;; (add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

;; ;;(semantic-add-system-include "~/exp/include/boost_1_37" 'c++-mode)
;; (semantic-mode 1)

;; (global-ede-mode 1)

;; ;;packages based on semantic
;; ;;to switch between cpp/h and fast method completion
;; (require 'eassist)

;;==============================================================
;;ecb配置
;;==============================================================
;;(require 'ecb)
;;开启ecb用,M-x:ecb-activate
(require 'ecb-autoloads)
;;自动启动ecb并且不显示每日提示
;;(require 'ecb)
;;(setq ecb-auto-activate t)
(setq ecb-tip-of-the-day nil)

(require 'cc-mode)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)


(defun my-c-mode-common-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  ;;; hungry-delete and auto-newline
;;  (c-toggle-auto-hungry-state 1)
  (define-key c-mode-base-map [(control \`)] 'hs-toggle-hiding)
  (define-key c-mode-base-map [(return)] 'newline-and-indent)

  (define-key c-mode-base-map [(meta \`)] 'c-indent-command)
  ;;bind key for switching cpp/h
;;  (define-key c-mode-base-map (kbd "M-o") 'eassist-switch-h-cpp)
  ;;(define-key c-mode-base-map (kbd "M-m") 'eassist-list-methods))

;;  (define-key c-mode-base-map [(tab)] 'hippie-expand)
;;  (define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
;;  (define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)
  ;;预处理设置
  (setq c-macro-shrink-window-flag t)
  (setq c-macro-preprocessor "cpp")
  (setq c-macro-cppflags " ")
  (setq c-macro-prompt-flag t)
  (setq hs-minor-mode t)
  (setq abbrev-mode t)
)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(defun my-c++-mode-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  (c-set-style "stroustrup")
;;  (define-key c++-mode-map [f3] 'replace-regexp)
)

;;配置Semantic搜索范围
;; (setq semanticdb-project-roots
;; 	  (list
;; 	   (expand-file-name "/")))
;;自定义补全命令，如果单词在中间就补全，否则就tab
(defun my-indent-or-complete()
  (interactive)
  (if (looking-at "\\>")
	  (hippie-expand nil)
	  (indent-for-tab-command))
  )
;;补全快捷键，ctrl+tab用senator补全，不显示列表
;;alt+/补全，显示列表让选择
;; (global-set-key [(control tab)] 'my-indent-or-complete)
;; (define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)
;; (autoload 'senator-try-expand-semantic "senator")
;; (setq hippie-expand-try-functions-list
;; 	  '(
;; 		senator-try-expand-semantic
;; 		try-expand-dabbrev
;; 		try-expand-dabbrev-visible
;; 		try-expand-dabbrev-all-buffers
;; 		try-expand-dabbrev-from-kill
;; 		try-expand-list
;; 		try-expand-list-all-buffers
;; 		try-expand-line
;; 	p	try-expand-line-all-buffers
;; 		try-complete-file-name-partially
;; 		try-complete-file-name
;; 		try-expand-whole-kill
;; 		)
;; 	  )
;;cc-mode的括号自动匹配
;;(defun my-c-mode-auto-pair ()
;;  (interactive)
;;  (make-local-variable 'skeleton-pair-alist)
;;  (setq skeleton-pair-alist  '(
;;                   (?` ?` _ "''")
;;                   (?\( ?  _ " )")
;;                   (?\[ ?  _ " ]")
;;                   (?{ \n > _ \n ?} >)))
;;  (setq skeleton-pair t)
;;  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;;  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;;  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
;;  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
;;(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
;;(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)
	  
;;==========================================================
;;加载cscope
;;==========================================================
(require 'xcscope)

;;==========================================================
;;YASnippet的配置
;;==========================================================
;;太强大了，强大的模板功能
(require 'yasnippet)    ;;not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/install/yasnippet-0.6.1c/snippets")

;; ;; CC-mode
;; (add-hook 'c-mode-hook '(lambda ()
;;         (setq ac-sources (append '(ac-source-semantic) ac-sources))
;;         (local-set-key (kbd "RET") 'newline-and-indent)
;;         (linum-mode t)
;;         (semantic-mode t)))

;; Autocomplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (expand-file-name
             "~/.emacs.d/elpa/auto-complete-1.4.20110207/dict"))
(setq ac-comphist-file (expand-file-name
             "~/.emacs.d/ac-comphist.dat"))
(ac-config-default)

;;自动补全
;;(require 'auto-complete-config)
;;(ac-config-default)
