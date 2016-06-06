(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))
(load-theme 'zenburn t)
(global-set-key (kbd "C-<right>") 'smart-shift-right)
(global-set-key (kbd "C-<left>") 'smart-shift-left)
(global-set-key (kbd "C-<up>") 'smart-shift-up)
(global-set-key (kbd "C-<down>") 'smart-shift-down)
