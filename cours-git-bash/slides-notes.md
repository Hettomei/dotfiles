
## 1er TD : y a plus github.com

3 terminaux

1)
mkdir -p /tmp/prez
cd /tmp/prez
git init --bare

2)
cd /tmp
git clone /tmp/prez thomas
cd prez
touch foo
git add foo
git cm "Add foo"

3)
cd /tmp
git clone /tmp/prez marie
cd prez
touch foo
git add foo
git cm "Add foo"

script --timing=probleme_bare.txt probleme_bare.log
scriptreplay --timing=probleme_bare.txt probleme_bare.log -m 0.1
