;; INSTALL PACKAGES

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    material-theme))

(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

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
(set-face-background hl-line-face "gray13")

;; save emacs backups to temp file directory
(setq backup-directory-alist
      `((".*" . ,"~/.emacs-backups/")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/.emacs-backups/" t)))


;; change minibuffer color
(set-face-foreground 'minibuffer-prompt "white")

;; Enable scrolling horizontally
(put 'scroll-left 'disabled nil)

;; Disable menubar
(menu-bar-mode -1)

;; Disable startup message
(setq inhibit-startup-message t)

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

;;(add-hook 'python-mode-hook
;;  (local-set-key "\C-c\C-c" 'python-compile))

;; Never expire ssh password
(setq password-cache-expiry nil)

;;(require 'better-defaults)
(mapc #'(lambda (package)
          (require package))
      myPackages)

(load-theme 'material t)
