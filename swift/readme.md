# Doc

openrc https://www.ovh.com/fr/publiccloud/guides/g1852.charger_les_variables_denvironnement_openstack

https://www.ovh.com/manager/public-cloud/?onboarding#/pci/projects/7fd9ef0750584d07a81a2e291150143f/storages/cloud-archives

https://docs.ovh.com/fr/public-cloud/recuperer-les-donnees-provenant-de-pca/#avec-le-client-openstack-swift

https://docs.ovh.com/fr/storage/pca/sftp/

# Installation

Besoin de swift-client et d'une sorte de fichier secret.

```
sudo apt install swift-client

ou

pip3 install python-swiftclient

```

se connecter sur le compte ovh https://www.ovh.com/manager/cloud/index.html, et telecharger le fichier openrc.sh
```
source ./openrc.sh
```

# Exemple 1

```
cd desktop
swift list
swift post angie # creer conteneur # attention, on veut du a froid, il vaut mieux le creer sur ovh
swift upload angie Angie --changed
```

# Exemple 2

:warning:, celui-ci va créer un conteneurs

```
cd google-6p-fevrier-aout-2017
swift upload --changed --segment-size 104857600 google-6p-fevrier-aout-2017 .
```

# Exemple 3 : synchroniser tout un dossier de photos

```
cd /home/tim/programmes/my_computer_conf/swift/
source openrc.sh

cd /media/sf_timwin/Pictures
# ou
cd /mnt/c/Users/tim/Pictures

swift upload --changed --segment-size 104857600 photos-archive .
```

# New avec sftp

aller sur https://www.ovh.com/manager/public-cloud/#/pci/projects/7fd9ef0750584d07a81a2e291150143f/storages/cloud-archives/5a47396a6457316c626e527a4c6c4e4352773d3d

sftp pca@gateways.storage.sbg.cloud.ovh.net

Ensuite, le mot de passe est dans keepass "ovh password sftp photo archive"


on peut aussi le faire avec file zilla

On ne peut pas téléchargé les fichiers car il faut 'un frozen' les fichiers.

Comment Degeler / unfreeze :

Telecharger une premiere fois. Ca ne marche pas. Attendre. C'est unfreeze. re telecharger.
