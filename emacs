;;Exwm Emacs X Windows Manageer  
(require 'exwm)
(require 'exwm-config)
(require 'exwm-systemtray) (exwm-systemtray-enable)
(exwm-config-default)
;;
;;
;; eliminar warning cl is deprecated
(setq byte-compile-warnings '(cl-functions))
;;
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(exwm-workspace-display-echo-area-timeout 1)
 '(exwm-workspace-minibuffer-position nil)
 '(exwm-workspace-show-all-buffers nil)
 '(helm-completion-style 'emacs)
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(neotree vterm helm pdf-tools use-package exwm lsp-mode openwith with-editor web-mode treepy spacemacs-theme prettier-js powerline markdown-mode highlight-indentation flycheck find-file-in-project emms emmet-mode elfeed dictionary company auto-complete add-node-modules-path))
 '(pdf-view-midnight-colors '("#b2b2b2" . "#292b2e"))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(spacemacs-theme-comment-italic nil)
 '(spacemacs-theme-custom-colors nil)
 '(spacemacs-theme-keyword-italic nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 83 :width normal))))
 '(aweshell-alert-buffer-face ((t (:foreground "#ff2d55" :weight bold))))
 '(pdf-view-region ((((background light)) (:inherit region :background "dim gray")) (((background light)) (:inherit region))))
 '(term-color-black ((t nil)))
 '(vterm-color-blue ((t (:background "#4f97d7" :foreground "orange red"))))
 '(vterm-color-cyan ((t (:background "#28def0" :foreground "blue"))))
 '(vterm-color-green ((t nil))))

 (package-initialize)

 (setq inhibit-startup-message t)
 ;
 ;;; No mostrar la barra del menú:
 (menu-bar-mode -1)					
 ;;; Numeros de linea:
 ;;global-linum-mode t

 ;;; Añadir un espacio entre el número de linea y el texto de la
 ;;; linea al lanzar M-x linum-mode (ver números de linea)
 (setq linum-format "%d ")
 ;
 ;; No hacer copias de seguredad ni crear archivos #auto-save#
 (setq make-backup-files nil)
 (setq auto-save-default nil)
 ;    
 ;;; Reemplazar "yes" y "no" por "y" y "n"
 (fset 'yes-or-no-p 'y-or-n-p)
 ;
 ;;; Mover a la papelera al borrar archivos y directorios:
 (setq delete-by-moving-to-trash t
 trash-directory "~/.local/share/Trash/files")
 ;
 ;;; guardar la sessión al cerrar emacs y restaurarla
 ;;; al arrancar-la de nuevo. Cero (0) para desactivar:
 (desktop-save-mode 0)
 ;
 ;;; Para que se muestren todos los buffers abiertos al
 ;;; pulsar C-x b (ido)
 (ido-mode 1)
 ;;; Ignorar determinados buffers.
 (setq ido-ignore-buffers '("^ " "*Completions*"
                            "*Shell Command Output*"
                            "*Messages*" "Async Shell Command"
                            "*scratch*"
                            "*tramp*"))
;
;;;;;;tamaño de la fuente;;;;;				       
(global-set-key [C-kp-add] 'text-scale-increase)
;
(global-set-key [C-kp-subtract] 'text-scale-decrease)
;
;;;Cambiar tamaño ventana de buffer
(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)
;;;

;;;atajo para linum
;;
(global-set-key (kbd "<f6>") 'linum-mode)

;;;;;;;; sudo ;;;;;;;;;
 (defun sudo-open-file (file)
   "Abrir archivo com privilegios de root"
   (interactive "FFind file: ")
   (set-buffer
   (find-file
   (concat "/sudo::"
   (expand-file-name file)))))
;;; atajo para la función sudo-open-file con C-c s
(global-set-key (kbd "C-c s") 'sudo-open-file)
;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Activar Flyspell en modo texto y modos relacionados
(add-hook 'text-mode-hook
	  '(lambda () (flyspell-mode 1)))
;;
(setq-default ispell-program-name "aspell")
;;
;;;;;;;;;;Repsitorios;;;;;;;;;
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
;;
;;;;;;;;PACKAGE: auto-complete;;;;;;;;;
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
;;
;;;;;;;; PACKAGE: elfeed ;;;;;;;               
(add-to-list 'load-path "~/.emacs.d/elfeed/")
(require 'elfeed)
(setq elfeed-feeds
  '(
    ("https://ondahostil.wordpress.com/feed/" emacs)
    ("https://elpinguinotolkiano.wordpress.com/feed/" emacs)
    ("https://lapipaplena.wordpress.com/category/emacs/feed/" emacs)
    ("https://lamiradadelreplicante.com/feed/" softwareLibre)
    ("http://feeds.feedburner.com/blogspot/slLohK" borges)
    ("https://surdelsur.com/es/feed/" argentina) 
    ("https://www.youtube.com/feeds/videos.xml?channel_id=UCJYiSCIMWDXBJiuID2pmFVA" youtube)
    ("https://www.youtube.com/feeds/videos.xml?channel_id=UCX9NJ471o7Wie1DQe94RVIg" youtube)
    ("https://www.youtube.com/feeds/videos.xml?channel_id=UC07xim4Gg8kOk3uZwMrGNeQ" youtube)
    ("https://www.youtube.com/feeds/videos.xml?channel_id=UCbQCKBuL_gYvl8Z8zvObJog" youtube)
    "https://colaboratorio.net/feed/"
    "http://www.maxxcan.com/feed/"
    "https://www.linuxito.com/?format=feed&type=rss"
    "http://blog.chuidiang.com/feed/"
    "http://quijotelibre.com/feed/"
    "http://www.blackhats.es/wordpress/?feed=rss2"
    "http://daemons.it/rss.xml"
    "https://hackemate.ninja/feed"
    "http://danielclimente.com/feed"
    "http://muylinux.com/feed"
    "http://www.ochobitshacenunbyte.com/feed"
    "http://emacsrocks.com/atom.xml"
    "https://feeds.feedburner.com/debianhackers"
    "http://blog.desdelinux.net/feed"
    "https://poesiabinaria.net/feed"
    "https://linuxadictos.com/feed"
    "http://ayudawp.com/feed"
    "https://picodotdev.github.io/blog-bitix/feed"
    "https://www.adictosaltrabajo.com/feed"
    "https://www.octuweb.com/feed"
    "http://planet.emacs-es.org/feed"
    "http://planet.emacs-es.org/atom.xml"
    "http://ugeek.github.io/feed"
    "http://elatareao.es/feed"
    "https://elblogdelazaro.gitlab.io/feed"
    "https://desarrolloweb.com/feed"
    "https://tublogfacil.com/feed"
    "https://notxor.nueva-actitud.org/rss.xml"
    "https://juncotic.com/feed/"
    "https://linuxtotal.com.mx/linuxtotal.xml"
    "https://debianhackers.net/feed"
    ))

    (global-set-key [f7] 'elfeed)
    (global-set-key [f8] 'elfeed-update)
    (global-set-key [f5] 'eww)
    (global-set-key (kbd "C-x w o") 'eww)

    (global-set-key (kbd "C-x w b") 'eww-add-bookmark)
    (global-set-key (kbd "C-x w l") 'eww-list-bookmarks)
    (global-set-key (kbd "C-x w f") 'eww-open-file )
    
;;filtro de busqueda prederminado
(setq-default elfeed-search-filter "@1-week-ago +unread ") 

;;;;;;;;;fin de la configuración de elfeed;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;Package web-mode;;;;;;;
(defun bs-web-mode-hook ()
   (local-set-key '[backtab]' sangrado-relativo)
   (setq indent-tabs-mode nil)
   (setq web-mode-markup-indent-offset 4
         web-mode-css-indent-offset 4
	 web-mode-php-indent-offset 4
         web-mode-code-indent-offset 4))

 (add-hook 'web-mode-hook' bs-web-mode-hook)
;;; Package emmet-mode con web-mode
 (add-hook 'web-mode-hook' emmet-mode)
;;; Prettier con web-mode
 (add-hook 'web-mode-hook #'(lambda ()
                            (enable-minor-mode
                             '("\\.jsx?\\'" . prettier-js-mode))))
;;
;;; Resaltar sintaxis en jsx
(setq web-mode-content-types-alist '(( " jsx " . " \\ .js[x]?\\'")))
(setq web-mode-content-types-alist '(( " js " . " \\ .js[x]?\\'")))
;;
;;
;;;abrir automaticamente web-mode para estos tipos de archivos
 (add-to-list 'load-path "~/.emacs.d/elpa/web-mode-20180813.1350/")
 (autoload 'web-mode "web-mode" t)
 (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode ))
 (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.js?$\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
;;
;;;;;;;;; fin de web-mode;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;Prettier;;;;;;;
(require 'prettier-js)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
;;;;;;;;;;;;;;;;;;;;;;;

(defun enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
(if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
      (funcall (cdr my-pair)))))

;;;;;;;;Package emms;;;;;
;;
(add-to-list 'load-path "~/.emacs.d/lisp/emms-4.0/")
(require 'emms-setup)
(emms-standard)
(emms-default-players)
;;deshabilitar info de track en mode-line
(emms-mode-line 0)
(setq emms-source-file-default-directory "~/datos/")
;;
;;; Atajos emms
;;; Atajo para emms-play-m3u-playlist, lista de radios (C-c p):
 (global-set-key (kbd "C-c p") 'emms-play-m3u-playlist)
;;; Atajo para emms-add-directory (C-c d):
(global-set-key (kbd "C-c d") 'emms-add-directory)
;;; Atajos para controlar en volume
(global-set-key [f2] 'emms-volume-mode-plus)
(global-set-key [f1] 'emms-volume-mode-minus)
;;(global-set-key (kbd "C-c o") 'emms-volume-mode-plus)
;;;;;fin emms;;;;;;;
;;;;;;;;;;;;;;;;;;;;
;;

;;;;;Spacemacs theme;;;;
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'spacemacs-dark t)
(setq spacemacs-theme-comment-italic t)
;;
;;;;;;Ajustar el prompt de eshell;;;;;
(setq eshell-prompt-function
(lambda nil
(concat (getenv "USER")
(if (= (user-uid) 0) " # " " $ "))))
;;; Especificar ruta a la shell que voy a usar:
;;(setq explicit-shell-file-name “/bin/bash”)
;;; mensaje de bienvenida al entrar a la eshell:
;;(setq eshell-banner-message “n… entrando en emacs shell…nn”)
;;;
(put 'upcase-region 'disabled nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;;;; Abrir eshell y myTodo al iniciar Emacs
(add-hook 'emacs-startup-hook 
(lambda ()
            (cd default-directory)
            (aweshell-new)))
(find-file (expand-file-name "datos/webDav/org/myTodo.org" default-directory))
;;
;;
;; Colapsar funciones 
(add-hook 'prog-mode-hook #'hs-minor-mode)
(global-set-key (kbd "C-c <right>") 'hs-show-block)
(global-set-key (kbd "C-c <left>") 'hs-hide-block)
;;
;;
;; Activación org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitch)
;;
;; Abrir archivos con programas externos
(require 'openwith)
(openwith-mode t)
(setq openwith-associations '(
;;   ("\\.pdf\\'" "zathura" (file))
   ("\\.cbr\\'" "zathura" (file))
))
;;
;;
;; Aweshell
(add-to-list 'load-path (expand-file-name "~/.emacs.d/aweshell"))
(require 'aweshell)
;; atajos para aweshell
(global-set-key (kbd "\C-x n") 'aweshell-new)
(global-set-key (kbd "\C-x x") 'aweshell-next)
(global-set-key (kbd "\C-x p") 'aweshell-prev)
(global-set-key (kbd "\C-l") 'aweshell-clear-buffer)
(global-set-key (kbd "\C-c b") 'aweshell-switch-buffer)
(global-set-key (kbd "\C-c o") 'aweshell-dedicated-open)
(global-set-key (kbd "\C-c t") 'aweshell-dedicated-toggle)
(global-set-key (kbd "\C-c c") 'aweshell-dedicated-close)
;;
;;
;;React snippets
;;(add-to-list 'load-path "~/.emacs.d/elpa/react-snippets-20181002.1046/")
;;(require "react-snippets")
;;
;;
(require 'powerline)
(powerline-vim-theme)
;;
;;bloquear C-z
(global-unset-key (kbd "C-z"))
;;
;;pdf-tools dark
(add-hook 'pdf-tools-enabled-hook 'pdf-view-midnight-minor-mode)
;;
;;
;; vterm
(add-to-list 'load-path ".emacs.d/elpa/vterm-2020926.1215")
(require 'vterm)
;;
;;
;; neoTree
(add-to-list 'load-path "/.emacs.d/elpa/neotree-20200324.1946e")
(require 'neotree)
(global-set-key [f11] 'neotree-toggle)

;;
;;;;;;; Helm
(require 'helm)
(require 'helm-config)

(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z")  'helm-select-action)

(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)

(helm-mode 1)

;;(require 'helm-descbinds)
;;(helm-descbinds-mode)

;;atajo para lanzar aplicaciones externas
(exwm-input-set-key (kbd "s-<") 'helm-run-external-command)
(push (elt (kbd "s-<") 0) exwm-input-prefix-keys)

;;atajos para aplicaciones especificas
;;*-*-*-*min*-*-*-*
(exwm-input-set-key (kbd "s-m") (lambda ()
				  (interactive)
				  (let
				      ((comando "min --no-sandbox"))
				    (start-process-shell-command comando nil comando))))

(push (elt (kbd "s-m") 0) exwm-input-prefix-keys)
;;*-*-*-*-*-*-*-*-*-*

;;*-*-*ranger*-*-*-*
(exwm-input-set-key (kbd "s-f") (lambda ()
				  (interactive)
				  (let
				      ((comando "xterm ranger"))
				    (start-process-shell-command comando nil comando))))
(push (elt (kbd "s-f") 0) exwm-input-prefix-keys)
;;*-*-*-*-*-*-*-*-*-*

;;*-*-*alsamixer*-*-*-*
(exwm-input-set-key (kbd "s-a") (lambda ()
				  (interactive)
				  (let
				      ((comando "xterm -e alsamixer"))
				    (start-process-shell-command comando nil comando))))
(push (elt (kbd "s-a") 0) exwm-input-prefix-keys)
;;*-*-*-*-*-*-*-*-*-

;;*-*-*mocp*-*-*-*
(exwm-input-set-key (kbd "s-p") (lambda ()
				  (interactive)
				  (let
				      ((comando "xterm -e mocp"))
				    (start-process-shell-command comando nil comando))))
(push (elt (kbd "s-p") 0) exwm-input-prefix-keys)
;;*-*-*-*-*-*-*-*-*-

;; open helm buffer inside current window, don't occupy the entire other window
(setq helm-split-window-in-side-p t)
;; move to end or beginning of source when reaching top or bottom of source.
(setq helm-move-to-line-cycle-in-source t)
(global-set-key (kbd "C-M-z") #'helm-resume)

(put 'dired-find-alternate-file 'disabled nil)
