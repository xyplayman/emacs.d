(when (eq window-system 'ns)
  (set-frame-font "Menlo-20" nil t))

(setq my-emacs-dir "~/.emacs.d/")

(add-to-list 'load-path (concat my-emacs-dir "extensions/better-defaults/"))
(require 'better-defaults)

(add-to-list 'load-path (concat my-emacs-dir "extensions/exec-path-from-shell/"))
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(add-to-list 'load-path (concat my-emacs-dir "extensions/swiper/"))
(require 'ivy)
(require 'counsel)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(setq enable-recursive-minibuffers t)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

(add-to-list 'load-path (concat my-emacs-dir "extensions/hydra/"))

(add-to-list 'load-path (concat my-emacs-dir "extensions/dash/"))

(add-to-list 'load-path (concat my-emacs-dir "extensions/magit/"))
