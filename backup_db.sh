#!/bin/bash
# ---------------------------------------
# MySQL Automatic Backup Script (RDS) for GitHub
# ---------------------------------------

# ===== SETTINGS =====
DB_HOST="rds-address"
DB_USER="db-user"
DB_PASS="db-password"
DB_NAME="db-name"
BACKUP_DIR="ec2/backup/dir"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
FILE_NAME="${DB_NAME}[backup]-${DATE}.sql.gz"

# ===== 1. Create a database dump and compress it =====
echo "[INFO] Starting '$DB_NAME' DB backup..."
mysqldump -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" | gzip > "${BACKUP_DIR}/${FILE_NAME}"

if [ $? -ne 0 ]; then
    echo "[ERROR] Failed to generate database backup."
    exit 1
fi
echo "[OK] Backup created: ${FILE_NAME}"

# ===== 2. Go to repository folder and commit =====
cd "$BACKUP_DIR" || { echo "[ERROR] Can't access $BACKUP_DIR"; exit 1; }

git pull
git add "${FILE_NAME}"
git commit -m "Your commit message..."
git push origin main  # adjust 'main' if your branchh has another name

if [ $? -ne 0 ]; then
    echo "[ERROR] Failed to upload backup to GitHub."
    exit 1
fi

echo "[OK] Backup uploaded to GitHub with success!"
