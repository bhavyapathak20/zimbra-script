## Overview
This repository contains scripts to extract Zimbra user information and import users into a Linux os. It extracts user email id and hashing techniques and outputs them in a CSV format. The import script uses the CSV to create users on the Linux system

## Steps
1. **Extracting Zimbra User Info**:
   - Connects to the Zimbra server.
   - Extracts user email id and password hashes.
   - Outputs in CSV format.

2. **Import Users to Linux**:
   - Reads the extracted CSV file.
   - Creates users in the Linux system.


### Extract Script (`extract.sh`)

  1. For executing the script:
     ```bash
     chmod +x extract.sh
     ```
  2. Running the script:
     ```bash
     ./extract_users.sh
     ```
  3. The output will be saved to `zimbra_users.csv`.

### Import Script (`import.sh`)

  1. Ensuring that the CSV file is in the same directory.
  2. Making the script executable:
     ```bash
     chmod +x import_users.sh
     ```
  3. Run the script:
     ```bash
     ./import_users.sh
     ```

