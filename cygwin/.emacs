;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Ben Quach's .emacs file for emacs version 22+
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-font-lock-mode 1)
(server-start 1)
(transient-mark-mode 1)
(delete-selection-mode 1)
(setq-default truncate-lines 1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq require-final-newline t)
(setq c-basic-offset t)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default csharp-basic-offset 2)
(setq indent-tabs-mode t)
(setq indent-line-function 'insert-tab)
;; add the folder /emacs/ to our load path so we can quickly load libraries
(add-to-list 'load-path "~/emacs/")
(add-to-list 'load-path "~/.emacs.d/")
(global-set-key (kbd "C-x i") 'indent-region)
(defadvice split-window-horizontally (after rebalance-windows activate)
  (balance-windows))
(setq c-default-style "linux"
          c-basic-offset 4)
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
   (setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

(add-to-list 'load-path "./.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "./.emacs.d//ac-dict")
(ac-config-default)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
