;;Arch linux .emacs file
;;uses several important packages
;; sr-speedbar, updated CEDET

(load-file (concat user-emacs-directory "~/cedet/cedet-devel-load.el"))
(load-file (concat user-emacs-directory "~/cedet/contrib/cedet-contrib-load.el"))
(require 'cc-mode)
;;only works with sr-speedbar package installed!!!
(setq sr-speedbar-right-side nil)



;;(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
;;(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
;;(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)
(add-to_list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
;;Add library defintions here or in a CEDET project file
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(defvar semantic-lex-c-preprocessor-symbol-file '())


(semantic-mode 1)
(global-ede-mode t)

;;(add-to-list 'semantic-lex-c-preprocessor-symbol-file "~/ogre/OgreMain/include/OgrePlatform.h")
;;(setq ogre-base-dir "~/ogre/OgreMain/include")
;;(semantic-add-system-include ogre-base-dir 'c++-mode)
;;(add-to-list 'auto-mode-alist (cons ogre-base-dir 'c++-mode))

(setq bgfx-base-dir "~/bgfx/include/")
(semantic-add-system-include bgfx-base-dir 'c++-mode)
(add-to-list 'auto-mode-alist (cons bgfx-base-dir 'c++-mode))


(defun highlight-changes-remove-after-save ()
  "Remove previous changes after save."
  (make-local-variable 'after-save-hook)
  (add-hook 'after-save-hook
			(lambda ()
			  (highlight-changes-remove-highlight (point-min) (point-max)))))


;;set control c space to autocomplete menu
(global-set-key (kbd "C-c SPC") 'semantic-ia-complete-symbol-menu)

;;enable MELPA packages
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
    (package-initialize))

;;make normal indent style
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
 '(ede-project-directories (quote ("/home/ben/planetrenderer")))
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (glsl-mode sr-speedbar))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
