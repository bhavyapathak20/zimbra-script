INPUT_FILE="zimbra_users.csv"

# Read CSV
while IFS=',' read -r email password_hash; do
  username="${email%@*}"
  if ! id "$username" &>/dev/null; then
    sudo useradd -m "$username" -s /bin/bash
    echo "User $username created successfully."
  else
    echo "User $username already exists."
  fi
done < <(tail -n +2 "$INPUT_FILE")
