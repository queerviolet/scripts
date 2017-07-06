(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (manoj-dark)))
 '(custom-safe-themes
   (quote
    ("37334644182e90da57661982ea35892056b843c4bba0479a0f600bd0a46d95da" "8d03d539fab75b419fad29402fc75e690e6f4d0ff7c1565a4018c327fa447465" default)))
 '(global-writeroom-mode t nil (writeroom-mode))
 '(line-number-mode nil)
 '(linum-format " %3d ")
 '(package-selected-packages (quote (fountain-mode markdown-mode writeroom-mode)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(writeroom-global-effects
   (quote
    (writeroom-set-alpha writeroom-set-menu-bar-lines writeroom-set-tool-bar-lines writeroom-set-vertical-scroll-bars writeroom-set-bottom-divider-width)))
 '(writeroom-major-modes (quote (text-mode markdown-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-delimiter-face ((t (:foreground "deep sky blue"))))
 '(font-lock-comment-face ((t (:foreground "deep sky blue" :slant oblique))))
 '(font-lock-function-name-face ((t (:foreground "mediumspringgreen" :weight normal :height 1.0))))
 '(font-lock-keyword-face ((t (:foreground "magenta"))))
 '(fringe ((t (:background "black" :foreground "Wheat"))))
 '(linum ((t (:foreground "dim gray"))))
 '(mode-line ((t (:background "black" :foreground "magenta" :box 1 :height 0.9))))
 '(mode-line-buffer-id ((t (:background "magenta" :foreground "black" :box (:line-width 5 :color "magenta") :weight bold :height 1.2))))
 '(mode-line-inactive ((t (:background "black" :foreground "grey80" :box 1 :weight light :height 0.9))))
 '(scroll-bar ((t (:background "black" :foreground "black"))))
 '(vertical-border ((t (:background "black"))))
 '(window-divider ((t (:foreground "white"))))
 '(window-divider-first-pixel ((t (:foreground "black"))))
 '(window-divider-last-pixel ((t (:foreground "black")))))
(set-face-attribute 'default nil :height 150)

;; (add-hook 'find-file-hook (lambda () (linum-mode 1)))
(global-set-key (kbd "C-t") 'fiplr-find-file)

(defun ashi-markdown-mode-hook ()
  (visual-line-mode 1))
(add-hook 'markdown-mode-hook 'ashi-markdown-mode-hook)
