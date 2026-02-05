# Pantheon Environment Setup Documentation

## Overview
This document describes the process and commands needed to clone a Drupal site from Pantheon into a local development environment, including code, database, and files.

## What Was Accomplished

### 1. Terminus Installation & Authentication
- Downloaded and installed Terminus CLI (v4.1.1)
- Set up environment variable `TERMINUS_TOKEN` for machine token authentication
- Successfully authenticated with Pantheon account (lm2000@kiza.com)

### 2. SSH Key Setup
- Generated a new RSA SSH key pair (4096-bit) at `~/.ssh/id_rsa`
- Added public key to Pantheon account for git repository access

### 3. Repository Cloning
- Used `terminus connection:info` to get the git clone URL
- Successfully cloned the simplifydrupal site repository into a local directory

### 4. Database & Files Backup
- Created and downloaded database backup (1.3MB) from simplifydrupal.dev environment
- Created and downloaded files backup (43.9MB) from simplifydrupal.dev environment

## Key Commands Reference

All commands needed for this process are documented in `/var/www/html/DOC/setup.sh`

The file includes:
- Terminus installation
- Environment variable configuration
- Pantheon authentication
- SSH key generation and setup
- Site lookup and configuration
- Git repository cloning
- Database and files backup creation and download

## Files Cloned/Downloaded

From simplifydrupal.dev environment:
- Git repository (49.3MB) - stored in `repository/` directory
- Database dump - `simplifydrupal-db.sql.gz` (1.3MB)
- Files archive - `simplifydrupal-files.tar.gz` (43.9MB)

## Next Steps

### For Development
1. Extract the database dump and import into local Drupal installation
2. Extract the files archive into the appropriate Drupal files directory
3. Configure local database connection settings
4. Set up local Drupal environment and run updates

### For Automation
The commands in `setup.sh` should be parameterized to:
- Accept site name as a parameter
- Accept output directory paths
- Allow for secure token handling (environment variables or secrets management)
- Support multiple team members with their own tokens
- Log all operations for troubleshooting

## Important Notes

- The token value should never be committed to the repository
- SSH keys should be protected and not shared
- All commands use relative paths to `./terminus` - PATH can be updated to add TOOLS directory
- The setup process requires network access to Pantheon's APIs and git server
- Different sites may require additional configuration steps beyond basic clone

## Environment Details

- Environment: DrupalForge cloud environment
- Terminus version: 4.1.1
- Site framework: Drupal 8
- Site plan: Sandbox

