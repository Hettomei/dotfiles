# Doc

read https://rclone.org/docs/

# Installation

Besoin de rclone et un fichier secret.

```
brew install rclone
```

se connecter sur le compte scaleway
ajouter une api keys https://console.scaleway.com/project/credentials
et copier la dans la conf de rclone vers `~/.config/rclone/rclone.conf`

## installation aws cli

malheureusement, avec rclone on ne peut pas transferer de GLACIER vers STANDARD
il nous faut donc awscli https://github.com/aws/aws-cli

```
sudo apt update
sudo apt install python3-pip
sudo python3 -m pip install awscli
sudo python3 -m pip install awscli-plugin-endpoint
```

## configurer awscli

https://www.scaleway.com/en/docs/object-storage-with-aws-cli/

Si tout va bien

```
aws s3 ls tim
                           PRE documents/
                           PRE photos/
```

Des exemples de fichiers de conf se trouve dans ce dossier.

# Scaleway, comment recuperer des fichier 'glacier'

Ex, j'ai ce dossier :

```
rclone lsd s:tim/photos/2020
           0 2021-04-10 17:54:31        -1 angie-2020-07
           0 2021-04-10 17:54:31        -1 angie-2020-08
           0 2021-04-10 17:54:31        -1 angie-2020-09
           0 2021-04-10 17:54:31        -1 angie-2020-10
           0 2021-04-10 17:54:31        -1 tim-2020-10
           0 2021-04-10 17:54:31        -1 tim-2020-11
           0 2021-04-10 17:54:31        -1 tim-2020-12
```
je veux les recuperer

1) les migrer de GLACIER vers l object storage STANDARD :

# Restauration de GLACIER vers STANDARD

https://www.scaleway.com/en/docs/storage/object/how-to/restore-an-object-from-glacier/

installer s3cmd : 

pip install s3cmd

# Restauration de GLACIER vers STANDARD oldway

https://www.scaleway.com/en/docs/object-storage-glacier/

on ne peut pas faire en recursif, on fait fichier par fichier

```
aws s3 ls tim/documents --recursive |  sed 's/^[0-9-]\+ [0-9:]\+ \+[0-9]\+ \(.\+\)$/"\1"/g'
aws s3api restore-object --bucket tim  --restore-request Days=7 --key "documents/2016-salaires.pdf"
> aucune sortie

aws s3api head-object --bucket tim  --restore-request Days=7 --key "documents/2016-salaires.pdf"
> {
    "AcceptRanges": "bytes",
    "Restore": "ongoing-request=\"false\", expiry-date=\"Thu, 22 Apr 2021 00:00:00 GMT\"",
    "LastModified": "Thu, 15 Apr 2021 22:04:05 GMT",
....
}
```

Si ongoing-request=false alors il a ete restauré

pour info, les trucs dans glacier :

```
$ aws s3api head-object --bucket tim --key "documents/2017-salaires.pdf"
{
    "ContentType": "application/pdf",
    ...
    "StorageClass": "GLACIER"
}
```


donc :

```
aws s3 ls tim/photos --recursive |  sed 's/^[0-9-]\+ [0-9:]\+ \+[0-9]\+ \(.\+\)$/"\1"/g' >> tmp/list_to_restore
```

attention, ca retourne tim/photos/truc.jpg et tim/photos-lolilol/machin.jpg

apres :
```
cat tmp/liste_reduite | xargs -L1 aws s3api restore-object --bucket tim  --restore-request Days=7 --key
rclone copy -P sg:tim/angie ./
```

# Sauvegarder / backup / copier un nouveau dossier:

Pour copier tout ce dossier :

```
rclone copy -P sync_to_all/ sg:tim/
rclone sync -P 2021/ sg:tim/photos/2021
```

# Voir les dossiers :

```
$ rclone lsd sg:tim

     1219853 2020-04-06 14:14:32        39 autre
           0 2020-04-06 14:14:32         0 autre_segments
     2551157 2020-04-06 14:14:32        97 documents
           0 2020-04-06 14:14:32         0 documents_segments
 ```


 ```
$ rclone lsd s:tim/documents
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
rclone copy s:documents ./documents
```

lorsque les docs sont frozen, on peut parfois voir :
```
2020/04/06 14:06:20 NOTICE: Received retry after error - sleeping until 2020-04-07T01:16:07.043186046+02:00 (11h9m46.060466188s)
```

On peut relancer la commande tant qu'on veut, la date ne change pas.


Par exemple, pour uploader tout le contenu de 'local documents' vers 'remote documents':

```
rclone copy ./documents s:documents
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
rclone copy --progress s:documents ./
```

rclone NE VA PAS CREER le dossier `documents` donc `1.txt` et `2.txt` seront directement `dans ./`

Si je fait

```
rclone copy s:documents ./documents
```

rclone va CRÉER le dossier `documents` qui copy remote:documents

## Delete some file in remote

Suppose we want to delete all .DS_Store in 's:documents'

Ensure both source / dest match (using `rclone check` )

```
$ rclone check s:documents ./documents
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
rclone sync -P ./documents s:documents
```

# Delete a full path (folder and file)

```
rclone delete -vvvv s:"photos/folder with file"
```

# déplacer un dossier

```
rclone move --progress s:wrong-name/sub-folder s:sub-folder
```

# commands

```
# Filter
rclone --include "IMG_201708*" move -P s:photos/nexus-2017 s:photos/nexus-2017-08
rclone --dry-run --include "IMG_201708*" move -P s:photos/nexus-2017 s:photos/nexus-2017-08
rclone size s:a/b/c
rclone move -P s:a/b s:a/c
rclone delete -P s:a/b
rclone tree s:a/b
```

# Du telephone vers s :

```
rclone --include '*202007*' copy -P '/run/user/1000/gvfs/mtp:host=Google_Pixel_3a_XL_939AX07UDE/Espace de stockage interne partagé/DCIM/Camera/' ./need_sync/tim-2020-07

cd `VERY LONG PATH TO google camera`
rclone --include '*_202008*' copy -P ./ ~/Documents/perso/need_sync/tim-2020-08

rclone copy -P need_sync/tim-2020-06 s:photos/2020/tim-2020-07
rclone --include '*_202007*' delete -P '/run/user/1000/gvfs/mtp:host=Google_Pixel_3a_XL_939AX07UDE/Espace de stockage interne partagé/DCIM/Camera/'

rclone --include '*_202008??_*' ls ./
rclone --include '*_202008??_*' delete ./

```

# De s vers s:

```
rclone --include "*_201712??_*" move -P s:photos/angie-2017-12--2018-08 s:photos/2017/angie-2017-12
```

# tl;dr

cd '/media/tgauthier/3809E1F82A15E1BA/sync_to_all/'
rclone sync -P ./documents sg:tim/documents
rclone sync -P ./photos sg:tim/photos

jdupes -r .
