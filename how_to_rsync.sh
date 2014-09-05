#Copy all programmes folder :

rsync -avh --exclude-from="/Users/tim/rsync_exclude_dir.txt" /Users/tim/programmes/ /Volumes/ZAT/tim/programmes/
rsync -avh --exclude-from="/Users/tim/rsync_exclude_dir.txt" /Users/tim/Pictures/toutes_les_photos/ /Volumes/ZAT/tim/photos/
rsync -avh --exclude-from="/Users/tim/rsync_exclude_dir.txt" /Users/tim/Pictures/ /Volumes/ZAT/tim/photos/
rsync -avh --exclude-from="/Users/tim/rsync_exclude_dir.txt" /Users/tim/Documents/ /Volumes/ZAT/tim/documents/
rsync -avh --exclude-from="/Users/tim/rsync_exclude_dir.txt" /Users/tim/jeux/ /Volumes/ZAT/tim/jeux/
rsync -avh --exclude-from="/Users/tim/rsync_exclude_dir.txt" /Users/tim/Music/ /Volumes/ZAT/tim/musiques/
