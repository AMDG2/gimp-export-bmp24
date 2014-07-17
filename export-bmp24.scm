; Script d'export en BMP 24bit
;
; Auteur : Baudouin Feildel
; Date 17/07/2014
;

(define (script-fu-export-bmp24 img dirname filename)
	(gimp-context-push)

	(let*
		(
			; Création de la variable image
			; et copie de l'image actuelle
			(image
				(car
					(gimp-image-duplicate img)
				)
			)
		)
		; Copier l'image actuelle
		(set! image (car (gimp-image-duplicate img)))

		; Applatir l'image
		(gimp-image-flatten image)

		; Enregistrer
		(file-bmp-save
			1     ; Non interactive
			image
			(car (gimp-image-get-active-drawable image)) ; Récupère le drawable de l'image
			(string-append "" dirname "/" filename)      ; Créer le chemin complet vers le fichier
			(string-append "" dirname "/" filename)      ; Créer le chemin complet vers le fichier
		)
	)

	(gimp-context-pop)
	(gimp-displays-flush)
)

(script-fu-register "script-fu-export-bmp24"
	"Export BMP 24 bit"
	"Exporte une image en BMP 24 bit"
	"Baudouin Feildel <baudouin@feildel.org>"
	"Baudouin Feildel"
	"Juillet 2014"
	"*"
	SF-IMAGE   "Image"          0
	SF-DIRNAME "Dossier"        "C:/"
	SF-STRING  "Nom du fichier" "image.bmp"
	; SF-FILENAME ne permet pas de créer de nouveau fichier
	; d'ou l'utilisation de SF-DIRNAME et SF-STRING
	;SF-FILENAME "Fichier" ""
)

(script-fu-menu-register "script-fu-export-bmp24"
	; "Export" est une entrée qui existe déjà dans le menu
	; Gimp va automatiquement placer notre Script après cette entrée
	"<Image>/File/Export")
