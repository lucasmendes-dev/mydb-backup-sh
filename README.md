# MySQL Automatic Backup Script (RDS) for GitHub

This Bash script automates the process of backing up a MySQL database hosted on **Amazon RDS** (or any MySQL server) and uploading the backup to a **GitHub repository** for safe storage and versioning.

## 🚀 Features
- Automatically generates a compressed `.sql.gz` backup of a MySQL database.
- Supports **Amazon RDS** or any MySQL-compatible host.
- Commits and pushes the backup file to a specified GitHub repository.
- Provides clear logging messages for each step.

---

## 📋 Requirements
Before using this script, make sure you have:
- **Bash** (Linux/MacOS) environment.
- `mysqldump` installed and accessible.
- **Git** installed and configured (repository already initialized).
- Network access to the MySQL/RDS server.
- Write permissions to the backup directory.
- GitHub repository linked to your local directory.

---

## ⚙️ Configuration
Edit the script and update the following variables:

```bash
DB_HOST="rds-address"      # MySQL/RDS host
DB_USER="db-user"          # MySQL username
DB_PASS="db-password"      # MySQL password
DB_NAME="db-name"          # MySQL database name
BACKUP_DIR="ec2/backup/dir" # Path to local backup folder (inside your Git repo)
