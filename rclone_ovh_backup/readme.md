# Doc

openrc https://www.ovh.com/fr/publiccloud/guides/g1852.charger_les_variables_denvironnement_openstack

https://www.ovh.com/manager/public-cloud/?onboarding#/pci/projects/7fd9ef0750584d07a81a2e291150143f/storages/cloud-archives

https://docs.ovh.com/fr/public-cloud/recuperer-les-donnees-provenant-de-pca/#avec-le-client-openstack-swift

https://docs.ovh.com/fr/storage/pca/sftp/

read https://rclone.org/docs/

# :warning: a savoir

Attention, il est possible que la creation d un conteneur se fasse dans 'Object Storage' et non
dans 'Public cloud archive' (pca)
Object Storage est bcp plus cher.

Une solution, mais pas verifier :
Ajouter cette ligne dans rclone.conf :

```
storage_policy = pca
```

Et apres la creation d un conteneur, aller verifier sur l'interface OVH si dans le bon group.

# Installation

Besoin de rclone et un fichier secret.

```
brew install rclone
```

se connecter sur le compte ovh https://www.ovh.com/manager/cloud/index.html, et
dans User et Role https://www.ovh.com/manager/public-cloud/#/pci/projects/7fd9ef0750584d07a81a2e291150143f/users
telecharger le fichier rclone.sh "Download an Rclone configuration file"

Editer le fichier :

- modifier la ligne 'PASSWORD' avec keepass 'ovh open stack stockage swift container rclone xubuntu hp'
- modifier le titre '[BackupStorage]' vers '[ovh]'

Copier la conf de `rclone.sh` vers `~/.config/rclone/rclone.conf`

# Sauvegarder / backup / copier un nouveau dossier:

Supposons que `photos-2020` n'existe pas sur `ovh:photos-archive`

Pour copier tout ce dossier :

```
rclone copy -P photos-2020 ovh:photos-archive/photos-2020
```

cela va automatiquement créé `photos-2020` sur ovh

Si demain j'ajoute des photos dans `photos-2020`, refaire la meme commande, seul les nouveaux éléments vont etre copiés.

et si jamais j ai supprimé des photos en local, elle ne seront pas supprimée à distance.

```
rclone copy -P photos-2020 ovh:photos-archive/2020/photos-2020
```

# Quick, efficace 

Recopier l arrborescence dans le dossier need_sync (avec dossier par annee
puis dossuer par mois) puis :

```
rclone copy --progress need_sync/ ovh:photos-archive
```


# Voir les dossiers :

2020/04/06 14:06:20 NOTICE: Received retry after error - sleeping until 2020-04-07T01:16:07.043186046+02:00 (11h9m46.060466188s)

```
$ rclone lsd ovh:

     1219853 2020-04-06 14:14:32        39 autre
           0 2020-04-06 14:14:32         0 autre_segments
     2551157 2020-04-06 14:14:32        97 documents
           0 2020-04-06 14:14:32         0 documents_segments
 ```


 ```
$ rclone lsd ovh:documents
           0 2020-04-06 14:14:39        -1 cours
           0 2020-04-06 14:14:39        -1 travail
 ```



# Copy

```
rclone copy - Copy files from source to dest, skipping already copied.
rclone sync - Make source and dest identical, modifying destination only.
rclone check - Check if the files in the source and destination match.
```

Par exemple, pour telecharger tout le contenu de 'remote documents' vers 'local documents':

```
rclone copy ovh:documents ./documents
```

lorsque les docs sont frozen, on peut parfois voir :
```
2020/04/06 14:06:20 NOTICE: Received retry after error - sleeping until 2020-04-07T01:16:07.043186046+02:00 (11h9m46.060466188s)
```

On peut relancer la commande tant qu'on veut, la date ne change pas.


Par exemple, pour uploader tout le contenu de 'local documents' vers 'remote documents':

```
rclone copy ./documents ovh:documents
```

# Copy et destination

given remote :
```
documents
  ./1.txt
  ./2.txt
```

Si je fait

```
rclone copy --progress ovh:documents ./
```

rclone NE VA PAS CREER le dossier `documents` donc `1.txt` et `2.txt` seront directement `dans ./`

Si je fait

```
rclone copy ovh:documents ./documents
```

rclone va CRÉER le dossier `documents` qui copy remote:documents

## Delete some file in remote

Suppose we want to delete all .DS_Store in 'ovh:documents'

Ensure both source / dest match (using `rclone check` )

```
$ rclone check ovh:documents ./documents
2020/04/07 08:13:20 ERROR : travail/amazon/fdcr: Entry doesn't belong in directory "travail/amazon/fdcr" (too short) - ignoring
2020/04/07 08:13:32 NOTICE: Local file system at /home/tgauthier/documents: 0 differences found
2020/04/07 08:13:32 NOTICE: Local file system at /home/tgauthier/documents: 296 matching files
```


When ok, delete local .DS_Store
```
fd -H .DS_Store --exec rm {}
```


then

```
rclone sync - Make source and dest identical, modifying destination only.
rclone sync -P source dest
rclone sync -P ./documents ovh:documents
```

# Delete a full path (folder and file)

```
rclone delete -vvvv ovh:"photos/folder with file"
```

# déplacer un dossier

```
rclone move --progress ovh:wrong-name/sub-folder ovh:sub-folder
```

# commands

```
# Filter
rclone --include "IMG_201708*" move -P ovh:photos-archive/nexus-2017 ovh:photos-archive/nexus-2017-08
rclone --dry-run --include "IMG_201708*" move -P ovh:photos-archive/nexus-2017 ovh:photos-archive/nexus-2017-08
rclone size ovh:a/b/c
rclone move -P ovh:a/b ovh:a/c
rclone delete -P ovh:a/b
rclone tree ovh:a/b
```

# Du telephone vers ovh :

```
rclone --include '*202007*' copy -P '/run/user/1000/gvfs/mtp:host=Google_Pixel_3a_XL_939AX07UDE/Espace de stockage interne partagé/DCIM/Camera/' ./need_sync/tim-2020-07

cd `VERY LONG PATH TO google camera`
rclone --include '*_202008*' copy -P ./ ~/Documents/perso/need_sync/tim-2020-08

rclone copy -P need_sync/tim-2020-06 ovh:photos-archive/2020/tim-2020-07
rclone --include '*_202007*' delete -P '/run/user/1000/gvfs/mtp:host=Google_Pixel_3a_XL_939AX07UDE/Espace de stockage interne partagé/DCIM/Camera/'

rclone --include '*_202008??_*' ls ./
rclone --include '*_202008??_*' delete ./

```

# De ovh vers ovh:

```
rclone --include "*_201712??_*" move -P ovh:photos-archive/angie-2017-12--2018-08 ovh:photos-archive/2017/angie-2017-12
```


# Comment partager de gros fichier

rclone ne fonctionne pas

Il faut swift

swift est un client open stack en python
pip install python-swiftclient

Ensuite, aller telecharger openrc.sh

source /tmp/openrc.sh

Attention, des fois le comtpe est chez SBG des fois vers SBG1.

La derniere fois, mon conteneur etait chez SBG.


Le mot de passe openstack est le meme que pour le compte yn2E95AwjCTB

Si tout ok : `swift stat` devrait donner qqchose
ou `swift list share`
'share' étant le nom de mon conteneur.


Ensuite, pour partager :

En 1 generer une longue clef :
Cette clef sera utilisé pour générer la suite

CLEF= date +%s | sha512sum
swift post -m "Temp-URL-Key: CLEF"
swift tempurl GET 60 https://storage.sbg.cloud.ovh.net/v1/AUTH_7fd9ef0750584d07a81a2e291150143f/share/tim_gau.sql.zip CLEF

le 60 signifie 60 secondes.

1 journée ->  86400 sec
1 semaine -> 604800 sec
