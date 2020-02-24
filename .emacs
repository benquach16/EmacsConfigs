;;make normal indent style
(setq c-default-style "linux"
      c-basic-offset 4)
(add-hook 'html-mode-hook
		  (lambda()
			(setq sgml-basic-offset 4)
			(setq indent-tabs-mode t)))

(setq-default indent-tabs-mode nil)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(defun set-dark-wm-theme (frame)
  (select-frame frame) ;; this is important!
  (when (display-graphic-p)
    (progn
      (when (file-exists-p "/usr/bin/xprop")
        (progn
          (defvar winid nil)
          (setq winid (frame-parameter frame 'outer-window-id))
          (call-process "xprop" nil nil nil "-f" "_GTK_THEME_VARIANT" "8u" "-set" "_GTK_THEME_VARIANT" "dark" "-id" winid))))))

(defun on-after-init ()
  (set-dark-wm-theme (selected-frame))
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

(add-hook 'after-make-frame-functions 'set-dark-wm-theme)
(custom-set-variables
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1)))

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
			 '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(setq package-archives '(("gnu"       . "http://elpa.gnu.org/packages/")
                         ;;("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa"     . "http://melpa.milkbox.net/packages/")))
(package-initialize) ;; You might already have this line

(set-variable 'ycmd-server-command '("python" "/usr/share/ycmd/ycmd"))

;; ============= ;; irony-mode ;; =============
(add-hook 'c++-mode-hook 'irony-mode) (add-hook 'c-mode-hook 'irony-mode)
;; ============= ;; company mode ;; =============
(add-hook 'c++-mode-hook 'company-mode) (add-hook 'c-mode-hook 'company-mode)
;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook () (define-key irony-mode-map [remap completion-at-point] 'irony-completion-at-point-async) (define-key irony-mode-map [remap complete-symbol] 'irony-completion-at-point-async)) (add-hook 'irony-mode-hook 'my-irony-mode-hook) (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options) (eval-after-load 'company '(add-to-list 'company-backends 'company-irony)) ;; (optional) adds CC special commands to `company-begin-commands' in order to ;; trigger completion at interesting places, such as after scope operator ;; std::| (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands) ;; ============= ;; flycheck-mode ;; ============= (add-hook 'c++-mode-hook 'flycheck-mode) (add-hook 'c-mode-hook 'flycheck-mode) (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)) ;; ============= ;; eldoc-mode ;; ============= (add-hook 'irony-mode-hook 'irony-eldoc) ;; ========================================== ;; (optional) bind TAB for indent-or-complete ;; ========================================== (defun irony--check-expansion () (save-excursion (if (looking-at "\\_>") t (backward-char 1) (if (looking-at "\\.") t (backward-char 1) (if (looking-at "->") t nil))))) (defun irony--indent-or-complete () "Indent or Complete" (interactive) (cond ((and (not (use-region-p)) (irony--check-expansion)) (message "complete") (company-complete-common)) (t (message "indent") (call-interactively 'c-indent-line-or-region)))) (defun irony-mode-keys () "Modify keymaps used by `irony-mode'." (local-set-key (kbd "TAB") 'irony--indent-or-complete) (local-set-key [tab] 'irony--indent-or-complete)) (add-hook 'c-mode-common-hook 'irony-mode-keys)
(eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(c-set-offset 'inexpr-class 0)
(set-foreground-color "#94e76b")
(set-background-color "grey8")
(global-font-lock-mode 1)
(server-start 1)
(transient-mark-mode 1)
(delete-selection-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
;;(set-default-font "Terminus (TTF)")
;;(setq default-frame-alist '((font . "Misc Fixed")))
;;(set-face-attribute 'default nil :height 40)
(set-default-font "Misc Fixed 9")
(set-face-attribute 'fringe nil :background nil)
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
(setq sr-speedbar-right-side nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.50")
 '(ecb-source-path (quote ("~/sns-rpg")))
 '(global-auto-revert-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (counsel-gtags counsel-projectile realgud lsp-ui ecb all-the-icons-ivy all-the-icons-dired all-the-icons flycheck company-ycmd ycmd flycheck-clang-analyzer helm projectile counsel ivy flycheck-irony company auto-complete-distel auto-complete-c-headers irony irony-eldoc glsl-mode company-irony-c-headers company-irony sr-speedbar ac-c-headers auto-complete minimap))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:background "grey10" :foreground "lawn green")))))


