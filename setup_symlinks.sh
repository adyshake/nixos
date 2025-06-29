# Remove any existing files first (be careful!)
for f in /home/adnan/nixos/*; do
  filename=$(basename "$f")
  sudo rm -f "/etc/nixos/$filename"
  sudo ln -s "$f" "/etc/nixos/$filename"
done
