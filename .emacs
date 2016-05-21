(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))
(load-theme 'zenburn t)

(defun indent-region(numSpaces)
  (progn
					; default to start and end of current line
    (setq regionStart (line-beginning-position))
    (setq regionEnd (line-end-position))

					; if there's a selection, use that instead of the current line
    (when (use-region-p)
      (setq regionStart (region-beginning))
      (setq regionEnd (region-end))
      )

    (save-excursion ; restore the position afterwards
      (goto-char regionStart) ; go to the start of region
      (setq start (line-beginning-position)) ; save the start of the line
      (goto-char regionEnd) ; go to the end of region
      (setq end (line-end-position)) ; save the end of the line

      (indent-rigidly start end numSpaces) ; indent between start and end
      (setq deactivate-mark nil) ; restore the selected region
      )
    )
  )

(defun untab-region (N)
  (interactive "p")
  (indent-region -4)
  )

(defun tab-region (N)
  (interactive "p")
  (if (use-region-p)
      (indent-region 4) ; region was selected, call indent-region
    (insert "    ") ; else insert four spaces as expected
    )
  )

(global-set-key (kbd "<backtab>") 'untab-region)
(global-set-key (kbd "<tab>") 'tab-region)
