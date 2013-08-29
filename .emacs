(setq load-path (cons "~/.emacs.d/elisp" load-path))

;; theme のパス
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; メニューバーを非表示にする
(menu-bar-mode 0)

;; バックアップフィアル作らない
(setq make-backup-files nil)

;; カーソル位置表示
(column-number-mode t)
;; 行番号表示
(global-linum-mode t)

(custom-set-variables
 ;; Custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("1ac9a474d289e6a44894d1b484b3aa5eb345cea6ed6f32ec5214c797ac7ddf23" "9fd20670758db15cc4d0b4442a74543888d2e445646b25f2755c65dcd6f1504b" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'monokai t)
