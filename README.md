# How to use it


## When you get a fresh new $HOME

Just run

```
./restore_windows.sh
./restore_emacs.sh
```

And read the comment at the end.

## To save current configuration

```
./copy_linux.sh
```

then `git push`

# Starting to automate vps installation

Look at first_install.md

# Ensemble programming / mob programming

Merci pour cette video : https://www.youtube.com/watch?v=c_oW0yJWveQ

besoin d installer :
```
sudo apt install fd-find entr
```

Je vous conseil de mettre ces deux fichier dans:

```
mv default/ensemble_programming_* ~/bin/
chmod +x ~/bin/ensemble_programming_*
```

puis

```
ensemble_programming_pull 15
```

ou

```
# surveille tous les fichiers
ensemble_programming_push . "WIP new feature"

# surveille les fichiers avec "py"
ensemble_programming_push py "WIP new feature"
```

# PowerShell tips

```
$me=Get-LocalUser TimotheeGauthier
$me | Get-LocalUser  | Select *

# set and see pass
$pass = Read-Host -AsSecureString
[Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pass))
$me | Set-LocalUser -Password $pass
$me | Set-LocalUser -UserMayChangePassword $false -PasswordNeverExpires $true

$pass = ConvertTo-SecureString "TopSecretPassword" -AsPlainText -Force
$Env:UserName
$Env:UserDomain
$Env:ComputerName
[System.Security.Principal.WindowsIdentity]::GetCurrent().Name

```
