# Doc

openrc https://www.ovh.com/fr/publiccloud/guides/g1852.charger_les_variables_denvironnement_openstack

swift https://www.ovh.com/fr/publiccloud/guides/g1916.debuter_avec_lapi_swift


# Installation

Besoin de swift-client et d'une sorte de fichier secret.

```
sudo apt install swift-client
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
