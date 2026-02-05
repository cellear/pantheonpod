# Pantheon to Drupal Forge Import Workflow

## Overview

This document describes the process for importing a Pantheon-hosted Drupal site to Drupal Forge for development.

## Prerequisites

- Terminus CLI installed and authenticated
- Pantheon site UUID or name
- Access to Pantheon Dashboard
- Drupal Forge environment ready

## Workflow Steps

### 1. Authenticate with Pantheon
```bash
terminus auth:login --machine-token=YOUR_TOKEN
```

### 2. Create Backups
```bash
# Backup database
terminus backup:create dev-sd-contentful.dev --element=database

# Backup files
terminus backup:create dev-sd-contentful.dev --element=files
```

### 3. Download Backups
```bash
# Get database URL
terminus backup:get dev-sd-contentful.dev --element=database --to=./database.tar.gz

# Get files URL  
terminus backup:get dev-sd-contentful.dev --element=files --to=./files.tar.gz
```

### 4. Extract Archives
```bash
tar -xzf database.tar.gz
tar -xzf files.tar.gz
```

### 5. Import into Drupal Forge
```bash
# Import database
mysql -u drupal -p drupal_db < database.sql

# Copy files to site directory
cp -r files/* /var/www/html/sites/default/files/
```

### 6. Database Search/Replace

Update domain references if moving from Pantheon domain to Drupal Forge domain:
```bash
drush sql-cli << 'SQL'
UPDATE node SET body = REPLACE(body, 'pantheonsite.io', 'drupalforge.app');
UPDATE field_data_body SET body_value = REPLACE(body_value, 'pantheonsite.io', 'drupalforge.app');
SQL
```

## Troubleshooting

See: `troubleshooting.md`

