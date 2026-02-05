# Troubleshooting Guide

## Terminus Issues

### "Permission denied (publickey)" when cloning

**Problem**: SSH key not recognized

**Solution**: Use HTTPS clone instead:
```bash
git clone https://github.com/cellear/pantheonpod.git
```

Or set up SSH key:
```bash
terminus ssh-key:add ~/.ssh/id_rsa.pub
```

### Terminus command not found

**Problem**: Terminus not installed

**Solution**: Install via included script or manually:
```bash
curl -O https://raw.githubusercontent.com/pantheon-systems/terminus-installer/master/builds/phar-latest.phar
chmod +x phar-latest.phar
sudo mv phar-latest.phar /usr/local/bin/terminus
```

## Database Import Issues

### "Access denied for user"

**Problem**: Wrong database credentials

**Solution**: Check `.env` or environment variables for correct database credentials

### SQL syntax errors

**Problem**: Database backup from different MySQL version

**Solution**: Try importing with compatibility flags:
```bash
mysql --no-defaults -u user -p db < backup.sql
```

## File Permissions

### "Permission denied" writing to files directory

**Problem**: Drupal files directory has wrong permissions

**Solution**:
```bash
chmod -R 775 /var/www/html/sites/default/files/
chown -R www-data:www-data /var/www/html/sites/default/files/
```

## Domain Issues

### Site shows Pantheon domain after import

**Problem**: Database still has old domain

**Solution**: Use Drush to update database:
```bash
drush sql-cli << 'SQL'
UPDATE node__field_link SET field_link_uri = REPLACE(field_link_uri, 'pantheonsite.io', 'drupalforge.app');
SQL
```

