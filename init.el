(when (eq window-system 'ns)
  (set-frame-font "Menlo-20" nil t))

(add-to-list 'load-path "extensions/better-defaults")
(require 'better-defaults)

(add-to-list 'load-path "extensions/exec-path-from-shell")
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
