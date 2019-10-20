(when (eq window-system 'ns)
  (set-frame-font "Menlo-20" nil t))

(setq my-emacs-dir "~/.emacs.d/")

(add-to-list 'load-path (concat my-emacs-dir "extensions/better-defaults/"))
(require 'better-defaults)

(fset 'yes-or-no-p 'y-or-n-p)
(global-visual-line-mode)
(setq inhibit-splash-screen t
      make-backup-files nil
      apropos-do-all t)

;; install packages
(require 'package)
(package-initialize)
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(let* ((my-packages-installed-p t)
       (my-packages '(exec-path-from-shell
                      counsel
                      magit
                      expand-region
                      undo-tree
                      which-key
                      treemacs
                      web-mode)))
  (dolist (package my-packages)
    (unless (package-installed-p package)
      (setq my-packages-installed-p nil)))
  (when (not my-packages-installed-p)
    (package-refresh-contents)
    (dolist (package my-packages)
      (unless (package-installed-p package)
        (package-install package)))))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(which-key-mode)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(setq enable-recursive-minibuffers t)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

(setq custom-file "~/.emacs.d/emacs-custom.el")
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
(load custom-file)
