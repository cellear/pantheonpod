# Drupal Forge Setup Guide

## Getting Started

Drupal Forge provides pre-configured Drupal development environments that can be spun up in minutes.

## Creating a New Site

1. Go to https://www.drupalforge.org/
2. Click "Create New Site" or use the template system
3. Choose a template (Drupal CMS, DrupalAI, etc.)
4. Configure basic settings
5. Deploy within seconds

## File Structure
```
/var/www/html/
├── web/            # Drupal web root
├── vendor/         # Composer dependencies
├── config/         # Configuration export
├── drush/          # Drush configuration
└── ...
```

## Database

- Default database: `drupal`
- Default user: `drupal`
- Located locally on container
- Credentials available in environment

## Common Tasks

### Import Drupal Site

See: `pantheon-import-workflow.md`

### Install Modules
```bash
composer require drupal/module_name
drush en module_name
```

### Export Configuration
```bash
drush config:export
rush cache:rebuild
```

