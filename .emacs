(setq c-default-style "linux"
      c-basic-offset 4)
(add-hook 'html-mode-hook
		  (lambda()
			(setq sgml-basic-offset 4)
			            (setq indent-tabs-mode t)))
(c-set-offset 'inexpr-class 0)
(set-foreground-color "green")
(set-background-color "black")
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
