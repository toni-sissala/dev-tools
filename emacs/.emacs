;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; This makes the buffer scroll by only a single line when the up or
;; down cursor keys push the cursor (tool-bar-mode) outside the
;; buffer. The standard emacs behaviour is to reposition the cursor in
;; the center of the screen, but this can make the scrolling confusing
(setq scroll-step 1)

;; In every buffer, the line which contains the cursor will be fully
;; highlighted
(global-hl-line-mode 1)

;; change minibuffer color
(set-face-foreground 'minibuffer-prompt "white")

;; Enable scrolling horizontally
(put 'scroll-left 'disabled nil)

;; Disable menubar
(menu-bar-mode -1)

;; Disable startup message
(setq inhibit-startup-message t)

;;(require 'package) ;; You might already have this line
;;(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
;;                    (not (gnutls-available-p))))
;;       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
;;  (add-to-list 'package-archives (cons "melpa" url) t))

(require 'package)
(add-to-list 'package-archives
                    '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    elpy
    sphinx-doc
    restclient
    monky
    material-theme
    gruvbox-theme))

(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
            myPackages)

;; to disable automatic indentation
(add-hook 'php-mode-hook
  (function (lambda ()
    (c-toggle-electric-state -1))))

;; to refresh current buffer
(defun refresh-file ()
  (interactive)
  (revert-buffer t t t)
)
;; hotkey for refresh
(global-set-key [f5] 'refresh-file)

;; tramp-configuration to make emacs work with ssh-tunneling.
(setq tramp-default-method "ssh")

;; tabs to spaces
(setq-default indent-tabs-mode nil)

;; Standard indentation
(setq standard-indent 4)

;; Use PEAR-formatting in php-mode.
(setq php-mode-force-pear 1)

;; python compiler
(defun python-compile ()
  "Use compile to run python programs"
  (interactive)
  (compile (concat "python " (buffer-name))))
(setq compilation-scroll-output t)

(add-hook 'python-mode-hook (lambda ()
                                   (require 'sphinx-doc)
                                   (sphinx-doc-mode t)))
          

;;(add-hook 'python-mode-hook
;;  (local-set-key "\C-c\C-c" 'python-compile))


;; never expire password cache
(setq password-cache-expiry nil)
(put 'downcase-region 'disabled nil)

;; run sudo shell commands
(defun sudo-shell-command (command)
  (interactive "MShell command (root): ")
  (with-temp-buffer
    (cd "/sudo::/")
    (async-shell-command command)))

;; Enable flycheck globally
;;(add-hook 'after-init-hook #'global-flycheck-mode)

(load-theme 'material t)

(require 'better-defaults)

(elpy-enable)

;; save emacs backups to temp file directory
(setq backup-directory-alist
      `((".*" . ,"~/.emacs-backups/")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/.emacs-backups/" t)))

;; Disable automatic indentation on new line.
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

;; Org-mode TODO: log time when marked done.
(setq org-log-done 'time)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("021720af46e6e78e2be7875b2b5b05344f4e21fad70d17af7acfd6922386b61e" "42b9d85321f5a152a6aef0cc8173e701f572175d6711361955ecfb4943fe93af" "ed0b4fc082715fc1d6a547650752cd8ec76c400ef72eb159543db1770a27caa7" "6ac7c0f959f0d7853915012e78ff70150bfbe2a69a1b703c3ac4184f9ae3ae02" "718fb4e505b6134cc0eafb7dad709be5ec1ba7a7e8102617d87d3109f56d9615" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" default)))
 '(package-selected-packages
   (quote
    (magit elpy yaml-mode sphinx-doc restclient monky material-theme gruvbox-theme groovy-mode better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
