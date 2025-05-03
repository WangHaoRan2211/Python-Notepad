#save as
sas_wtitle='Avertissement'
sas_wtext="Le nouveau chemin du fichier remplacera l'ancien chemin du fichier"

#themewin

themewin_title='Changer de thème'
themewin_light='Clair'
themewin_dark='Sombre'

#fontwin

fontwin_title='Paramètres de police'

#tagwin

tagwin_title='Paramètres de tag'
tagwin_startext="Entrez la position de départ (format : ligne.colonne, à partir de 1)"
tagwin_endtext="Entrez la position de fin (format : ligne.colonne, à partir de 1)"
tagwin_bg="Entrez la couleur d'arrière-plan"
tagwin_fg="Entrez la couleur de premier plan"
tagwin_name="Entrez le nom du tag"
tagwin_add="Ajouter un tag"
tagwin_remove="Supprimer un tag"

#langwin

langwin_title='Paramètres de langue'
langwin_info="Les paramètres de langue seront effectifs après le redémarrage du logiciel"
ok="OK"

#linksetwin
linksetwin_title = 'Paramètres des hyperliens'
linkinputtag = 'Entrer un nom de Tag existant'
linkinputlink = 'Entrer adresse hypertexte'
apply = 'Appliquer'
close = 'Fermer'

#Long Texts

comhelp="""open, -O, --open, /open : ouvre automatiquement un fichier Utilisation : python main.py --open {filePath} [Encoding]
filePath : chemin du fichier à ouvrir (peut être un chemin relatif ou absolu) Encoding : encodage du fichier à ouvrir (par défaut UTF-8)

/help, --help, -H, help : fenêtre d'explication Utilisation : python main.py --help

/set-theme, --set-theme, -ST, set-theme : lance le bloc-notes avec un thème personnalisé Utilisation : python main.py --set-theme {ThemeName}
ThemeName : nom du thème (au choix light ou dark)


{ValueName} : obligatoire [ValueName] : facultatif"""