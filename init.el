;; Exwm Emacs X Windows Manageer  
(add-to-list 'load-path "~/.emacs.d/xelb/")
(add-to-list 'load-path "~/.emacs.d/elpa/exwm-0.24/")
(require 'exwm)
(require 'exwm-config)
(exwm-config-default)
(exwm-enable)
;;
(setq gnutls-algorithm-priority "NORMAL: -VERS-TLS1.3")
;;
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
;;
;; Use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

(setq use-package-always-ensure t)
;;
;; Theme
(use-package flatland-theme
  :config
  (custom-theme-set-faces 'flatland
   '(show-paren-match ((t (:background "dark gray" :foreground "black" :weight bold))))
   '(show-paren-mismatch ((t (:background "firebrick" :foreground "orange" :weight bold))))))
;;
;;;Cambiar tamaño ventana de buffer
(use-package buffer-move
 :config
 (global-set-key (kbd "<C-up>") 'shrink-window)
 (global-set-key (kbd "<C-down>") 'enlarge-window)
 (global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
 (global-set-key (kbd "<C-right>") 'enlarge-window-horizontally))
;;
;;
;; Pdf-tools
(use-package pdf-tools
  :load-path ".emacs.d/elpa/pdf-tools-20200512.1524"
  :magic ("%PDF" . pdf-view-mode)
  :config
  (pdf-tools-install :no-query)
  (add-hook 'pdf-tools-enabled-hook 'pdf-view-midnight-minor-mode)
  )
;;
;;
(ivy-mode 1)
(use-package ivy
  :init
  ;; Añade los buffers de bookmarks y de recentf
  (setq ivy-use-virtual-buffers t)
  ;; Muestra las coincidencias con lo que se escribe y la posicion en estas
  (setq ivy-count-format "(%d/%d) ")
  ;; Un mejor buscador
  (setq ivy-re-builders-alist
        '((read-file-name-internal . ivy--regex-fuzzy)
          (t . ivy--regex-plus)))
  ;; No se sale del minibuffer si se encuentra un error
  (setq ivy-on-del-error-function nil)
  ;; ivy mete el simbolo ^ al ejecutar algunas ordenes, así se quita
  (setq ivy-initial-inputs-alist nil)
  ;; Dar la vuelta a los candidatos
  (setq ivy-wrap t)
  ;; Ver la ruta de los ficheros virtuales
  (setq ivy-virtual-abbreviate 'full)
  ;; Seleccionar el candidato actual (C-m en vez de C-S-m)
  (setq ivy-use-selectable-prompt t))
;;
(use-package swiper ;;busca dentro del fichero
:ensure t
:config
(global-set-key (kbd "C-s") 'swiper))
;;
(use-package counsel ;;;busca en el minibuffer
:ensure t
:config
 (global-set-key (kbd "M-x") 'counsel-M-x)
 (global-set-key (kbd "C-x C-f") 'counsel-find-file))
;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;; (global-set-key (kbd "<f1> l") 'counsel-find-library)
;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char))
;;
;;
;; replace buffer-menu with ibuffer
   (use-package ibuffer
     :ensure t
     :config
     (global-set-key (kbd "C-x C-b") #'ibuffer))
;;
;;
;; Org-mode
(use-package org
    :delight "Θ "
    :config
    (setq org-hide-emphasis-markers t))
;;
(font-lock-add-keywords 'org-mode
                        '(("^ +\\([-*]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
;; Mejorando el especto de los bullets
(use-package org-bullets
:ensure t
:config
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
;; Adaptando el texto a la ventana
(add-hook 'org-mode-hook 'visual-line-mode)
;;
;; Autocompletado para Org-mode
(use-package org-ac
  :ensure t
  :config
  (org-ac/config-default))
;;;;;;;
;;
;;
(use-package elfeed
  :ensure t
  :custom
  ;;filtro de busqueda prederminado
  (elfeed-search-filter "@1-week-ago +unread ")
  :config
  (global-set-key [f7] 'elfeed)
  (global-set-key [f8] 'elfeed-update)
  (global-set-key [f5] 'eww)

  (setq elfeed-feeds   
   '(("https://notxor.nueva-actitud.org/rss.xml" emacs)
     ("https://ondahostil.wordpress.com/feed/" emacs)
     ("http://emacsrocks.com/atom.xml" emacs)
     ("http://planet.emacs-es.org/feed" emacs)
     ("http://planet.emacs-es.org/atom.xml" emacs)
     ("http://blog.desdelinux.net/feed" linux)
     ("http://ugeek.github.io/feed")
     ("http://elatareao.es/feed")
     ("https://elblogdelazaro.gitlab.io/feed")
     ("http://quijotelibre.com/feed/")
     ("https://lapipaplena.wordpress.com/category/emacs/feed/" emacs)
     ("https://surdelsur.com/es/feed/")
     ("https://www.linuxito.com/?format=feed&type=rss")
     ("http://pragmaticemacs.com/feed/")
     )
   )
)

;; NeoTree
(use-package neotree
  :ensure t
  :load-path "/.emacs.d/elpa/neotree-20200324.1946"
  :config
;;  (setq neo-theme 'icons)
  (global-set-key [f11] 'neotree-toggle))
;;
;;
;; (use-package aweshell
;;   :load-path "~/.emacs.d/aweshell"
;;   :require 'aweshell
;;   :config
;;   (add-hook 'emacs-startup-hook 
;;     (lambda ()
;;             (cd default-directory)
;;             (aweshell-new)))
;;   )
;;
;; Aweshell
(add-to-list 'load-path "~/.emacs.d/aweshell")
(require 'aweshell)
(global-set-key (kbd "\C-x n") 'aweshell-new)
(global-set-key (kbd "\C-x x") 'aweshell-next)
(global-set-key (kbd "\C-x p") 'aweshell-prev)
(global-set-key (kbd "\C-l") 'aweshell-clear-buffer)
(global-set-key (kbd "\C-c b") 'aweshell-switch-buffer)
(global-set-key (kbd "\C-c o") 'aweshell-dedicated-open)
(global-set-key (kbd "\C-c t") 'aweshell-dedicated-toggle)
(global-set-key (kbd "\C-c c") 'aweshell-dedicated-close)
;; Lanzar aweshell al inicio
(add-hook 'emacs-startup-hook 
(lambda ()
            (cd default-directory)
            (aweshell-new)))
;; Y ya que esta abrir myTodo.org
(find-file (expand-file-name "~/storage/webDav/org/myTodo.org" default-directory))
;;
;;
;; Tamaño de la fuente
(set-face-attribute 'default nil :height 90)
;;
;; Cambiar tamaño de la fuente con C-+ y C--
(global-set-key [C-kp-add] 'text-scale-increase)
(global-set-key [C-kp-subtract] 'text-scale-decrease)
;;
;; Omitir mensaje de inicio
(setq inhibit-startup-message t)
;;
;; No mostrar la barra del menú:
(menu-bar-mode -1)					
;;; Numeros de linea:
;;global-linum-mode t
;; Mostrar numeros de linea conf f6
(global-set-key (kbd "<f6>") 'linum-mode)

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
;; Navegador por defecto
(setq browse-url-browser-function 'eww-browse-url)
;;
;;
;; Emms
(add-to-list 'load-path "~/.emacs.d/emms-6.0/")
(require 'emms-setup)
(emms-standard)
(emms-default-players)
;;directorio predeterminado de musica
(setq emms-source-file-default-directory "~/storage/webDav/musica/")
;;escuchar radio
(global-set-key (kbd "C-c p") 'emms-play-m3u-playlist)
(put 'dired-find-alternate-file 'disabled nil)
;;deshabilitar info track en mode-line
(emms-mode-line 0)
;;; Atajos para controlar el volumen
(global-set-key [f2] 'emms-volume-mode-plus)
(global-set-key [f1] 'emms-volume-mode-minus)
;;(global-set-key (kbd "C-c o") 'emms-volume-mode-plus)
;;

;;
;; sudo 
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
;; Prettier
(add-to-list 'load-path ".emacs.d/elpa/prettier-js-20180109.726")
(require 'prettier-js)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
;;
;;
;; auto-complete
(add-to-list 'load-path "/.emacs.d/auto-complete-20201011.1341/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete-20201041/dict")
(ac-config-default)
(add-to-list 'ac-modes 'web-mode)
;;
;;
;; Web-mode
;;
;; Abrir automaticamente web-mode para estos tipos de archivos
(add-to-list 'load-path "~/.emacs.d/elpa/web-mode-20201031.1125/")
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
;; Indentación
(defun my-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)    
(setq tab-width 2)
;;
;; resaltar comienzo y final de un tag
(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-current-element-highlight t)
;;
;; Emmet
(add-hook 'web-mode-hook  'emmet-mode)
;;
;; resaltar sintaxis jsx
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
;;;;;;;;; fin de web-mode;;;;;;;;;;;
;;
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(exwm-workspace-minibuffer-position (quote bottom))
 '(exwm-workspace-number 4)
 '(package-selected-packages
   (quote
    (emmet-mode elfeed web-mode use-package switch-window smex prettier-js prettier pdf-tools org-bullets org-ac neotree js2-mode flx flatland-theme exwm emms counsel company buffer-move))))
;;
;; Atajo para lanzar aplicaiones externas
;; Min
(exwm-input-set-key (kbd "s-m") (lambda ()
(interactive)
(let  ((comando "min --no-sandbox")) 
(start-process-shell-command comando nil comando))))
(push (elt (kbd "s-m") 0) exwm-input-prefix-keys)
;;
;; Xterm
(exwm-input-set-key (kbd "s-x") (lambda ()
(interactive)
(let  ((comando "xterm")) 
(start-process-shell-command comando nil comando))))
(push (elt (kbd "s-x") 0) exwm-input-prefix-keys)
;;
;; Mocp
(exwm-input-set-key (kbd "s-p") (lambda ()
(interactive)
(let  ((comando "xterm -e mocp")) 
  (start-process-shell-command comando nil comando))))

(push (elt (kbd "s-p") 0) exwm-input-prefix-keys)
;;
;; Alsamixer
(exwm-input-set-key (kbd "s-a") (lambda ()
(interactive)
(let  ((comando "xterm -e alsamixer")) 
(start-process-shell-command comando nil comando))))
(push (elt (kbd "s-a") 0) exwm-input-prefix-keys)
;;
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

