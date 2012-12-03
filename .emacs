;;;;;;;;;;;;;;;;;
; hs-minor-mode ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; permanently enable the hs-minor-mode
(add-hook 'prog-mode-hook #'hs-minor-mode)

; hs-minor-mode's shortcut
(global-set-key (kbd "C-h") 'hs-toggle-hiding)
(global-set-key (kbd "<f12>") 'hs-hide-all)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; end hs-minor-mode ;
;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "<f4>") 'goto-line)
