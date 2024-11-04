# Zimbra admin credentials 

ZM_ADMIN="admin@bhavyabook.local"
ZM_ADMIN_PASS="the_password"
ZM_ZIMBRA_DIR="/opt/zimbra"

# Output CSV file

OUTPUT_FILE="zimbra_users.csv"

# Hashing

hash_password() {
  echo -n "$1" | sha256sum | awk '{print $1}'
}

# Preparing CSV file

echo "Email Address,Password Hash" > "$OUTPUT_FILE"

# Get the list of users

cd "$ZM_ZIMBRA_DIR" || exit
user_list=$(sudo -u zimbra zmprov -l gaa)

# Looping 

for user in $user_list; do
  password_hash=$(sudo -u zimbra zmprov ga "$user" userPassword)
  if [[ -n "$password_hash" ]]; then
    hashed_password=$(hash_password "$password_hash")
    echo "$user,$hashed_password" >> "$OUTPUT_FILE"
  fi
done

echo "User data extracted to $OUTPUT_FILE"
