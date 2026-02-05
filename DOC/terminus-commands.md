# Terminus Commands Reference

## Authentication
```bash
# Login with machine token
terminus auth:login --machine-token=TOKEN

# Check current user
terminus auth:whoami

# Logout
terminus auth:logout
```

## Backups
```bash
# Create backups
terminus backup:create <site>.<env> --element=database|files|code

# List backups
terminus backup:list <site>.<env>

# Get backup download URL
terminus backup:get <site>.<env> --element=database

# Download directly to file
terminus backup:get <site>.<env> --element=files --to=/path/to/save
```

## Site Information
```bash
# Get site info
terminus site:info <site>

# List environments
terminus env:list <site>

# Get connection info
terminus connection:info <site>.<env>
```

## Drush/WP-CLI Remote Execution
```bash
# Run Drush command remotely
terminus remote:drush <site>.<env> -- <drush-command>

# Run WP-CLI command remotely
terminus remote:wp <site>.<env> -- <wp-command>
```

