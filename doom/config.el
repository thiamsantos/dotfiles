;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Thiago Santos"
      user-mail-address "thia.mdossantos@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Ubuntu Mono" :size 18)
      doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Disable projectile caching
(setq projectile-enable-caching nil)

(setq projectile-project-search-path '(("~/dev" . 3)))

;; Remove sourcemap from magit-todos scans
(setq magit-todos-exclude-globs '("*.map" "*.json"))

(setq +workspaces-switch-project-function
      (lambda (dir)
        (if (file-exists-p "README.md")
            (find-file (expand-file-name "README.md" dir))
          (doom-project-find-file dir))))

(use-package! magit-todos :after magit :config (magit-todos-mode))
(use-package! magit-todos :after magit :config (magit-delta-mode))

(map! :n "/" #'consult-line)

(map! :after terraform-mode
      :localleader
      :map terraform-mode-map
      :desc "terraform format" "f" #'terraform-format-buffer)

(map! :after elixir-mode
      :localleader
      :map elixir-mode-map
      :prefix ("t" . "test")
      "u" #'exunit-verify-all-in-umbrella)

(map! :after elixir-mode
      :localleader
      :map elixir-mode-map
      :desc "mix format" "f" #'elixir-format)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
