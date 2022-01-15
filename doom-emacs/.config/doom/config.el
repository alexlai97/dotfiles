(setq org-directory "~/Nextcloud/org/")
(defvar +org-life-file (expand-file-name "life.org" org-directory)
  "The org file for life.")
(defvar +org-daily-file (expand-file-name "daily.org" org-directory)
  "The org file for daily.")
(defvar +org-goals-file (expand-file-name "goals.org" org-directory)
  "The org file for goals.")
(defvar +org-journal-file (expand-file-name "journal.org" org-directory)
  "The org file for journal.")
(defvar +org-people-file (expand-file-name "people.org" org-directory)
  "The org file for people.")
(defvar +org-reflect-file (expand-file-name "reflect.org" org-directory)
  "The org file for reflect.")
(defvar +org-knowledge-base-dir (expand-file-name "knowledge-base/" org-directory)
  "The org-roam directory for knowledge.")

(setq user-full-name "Alex Lai"
      user-mail-address "alex@alexlai.xyz")

(setq display-line-numbers-type t)

(add-hook 'org-mode-hook 'auto-fill-mode)
(add-hook 'after-init-hook #'global-emojify-mode)

(setq-default TeX-engine 'xetex)
(setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
                              "xelatex -interaction nonstopmode %f"))

;; open apps
(setq org-file-apps
      '((auto-mode . emacs)
        (directory . emacs)
        ("\\.mm\\'" . default)
        ("\\.x?html?\\'" . "firefox %s")
        ("\\.pdf\\'" . default)
        ("\\.png\\'" . "sxiv \"%s\"" )
        ("\\.jpg\\'" . "sxiv \"%s\"" )
        ("\\.svg\\'" . "sxiv \"%s\"" )
        ("\\.gif\\'" . "mpv \"%s\""  )
        ("\\.mkv\\'" . "mpv \"%s\""  )
        ("\\.mp3\\'" . "mpv \"%s\""  )
        ("\\.mp4\\'" . "mpv \"%s\""  )
        ))

(after! org
  (setq
   org-todo-keywords
   '((sequence "TODO(t)" "DOING(i!)"  "|" "DONE(d!)" "KILL(k!)" )
     (sequence "MOVED(m@/!)" "CANCELED(c@)" "|"))
   org-todo-keyword-faces
   '(("DOING" . "green")
     ("MOVED" . "brown")
     ("KILL" . "grey")
     ("CANCELED" . (:foreground "blue" :weight bold))
     )))

(setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|10.*\\)")
     ("http" . "localhost:7890")
     ("https" . "localhost:7890")))

(setq doom-font (font-spec :family "DejaVuSansMono" :size 14))

(setq doom-theme 'doom-nord)

(after! org-capture
  (setq org-capture-templates
        '(
          ("d" "daily" entry
           (file+olp+datetree +org-daily-file)
           "* TODO %?\n%i\n%a" :prepend t)
          ("l" "life" entry
           (file+headline +org-life-file "Unfiled")
           "* %?\nCAPTURED: %U\n%i\n%a" :prepend t)
          ("t" "todo(life)" entry
           (file+headline +org-life-file "Unfiled")
           "* TODO %?\nCAPTURED: %U\n%i\n%a" :prepend t)
          ("j" "journal" entry
           (file+olp+datetree +org-journal-file)
           "* %U %?\n%i\n%a")
          ("r" "reflect" entry
           (file+olp+datetree +org-reflect-file)
           "* %U %?\n%i\n%a")
          )
        )
  )

(use-package org-roam
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory +org-knowledge-base-dir))

;; (use-package org-roam-server
;;   :ensure t
;;   :config
;;   (setq org-roam-server-host "127.0.0.1"
;;         org-roam-server-port 8080
;;         org-roam-server-export-inline-images t
;;         org-roam-server-authenticate nil
;;         org-roam-server-label-truncate t
;;         org-roam-server-label-truncate-length 60
;;         org-roam-server-label-wrap-length 20))

(use-package org-re-reveal
  :ensure t
  :config
  (setq org-re-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/"))

(require 'simplenote2)
(load! "simplenote.el")
(simplenote2-setup)
(map! :leader
      (:prefix-map ("S" . "simplenote")
       :desc "browse" "b" 'simplenote2-browse
       :desc "new-from-buffer" "n" 'simplenote2-create-note-from-buffer
       :desc "sync" "s" 'simplenote2-sync-notes
       )
      )
(use-package simplenote2
  :config
  (setq simplenote2-markdown-notes-mode 'markdown-mode
        simplenote2-notes-mode 'markdown-mode
        )
  )

(after! deft
  (setq deft-directory +org-knowledge-base-dir)
  )
