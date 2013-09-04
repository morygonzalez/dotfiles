(setq load-path (cons "~/.emacs.d/elisp" load-path))

;; メニューバーを非表示にする
(menu-bar-mode 0)

;; バックアップフィアル作らない
(setq make-backup-files nil)
(setq auto-save-default nil)

;; カーソル位置表示
(column-number-mode t)
;; 行番号表示
(global-linum-mode t)
(setq linum-format "%3d ")

;; 改行時のインデント
(global-set-key "\C-m" 'newline-and-indent)

;; scroll
(setq scroll-step 1)

;; package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Rakefile や .rake を Ruby モードで開く
(setq auto-mode-alist
      (append
        '(("\\.rb$" . ruby-mode)
          ("[Rr]akefile" . ruby-mode)
          ("\\.rake$" . ruby-mode))  auto-mode-alist))
;; vimrc-mode
(require 'vimrc-mode)
(add-to-list 'auto-mode-alist '(".vim\\(rc\\)?$" . vimrc-mode))

(custom-set-variables
 ;; Custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 ;; font
 '(default ((t (:height: 120 :background: "black" :foreground: "white" :weight normal :width: normal :slant normal :family "Menlo"))))
 '(mode-line ((t (:foreground "skyblue" :background "#222222" :box (:line-width 1 :color nil :style released-button)))))
 )

(load-theme 'molokai t)
