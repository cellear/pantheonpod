# 1. Download and install Terminus
curl -L https://github.com/pantheon-systems/terminus/releases/download/4.1.1/terminus.phar --output terminus
chmod +x terminus

# 2. Set environment variable with your machine token
export TERMINUS_TOKEN="your-machine-token-here"

# 3. Authenticate with Pantheon
./terminus auth:login --machine-token=$TERMINUS_TOKEN

# 4. Verify authentication (optional)
./terminus site:list | wc

# 5. List all sites in JSON format
./terminus site:list --format=json | jq . | grep -n site-name

# 6. Get detailed info for site-name site
./terminus site:list --format=json | jq '.[] | select(.name == "site-name")'

# 7. Generate SSH key pair
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""

# 8. Display public key (for reference)
cat ~/.ssh/id_rsa.pub

# 9. Add SSH key to Pantheon account
./terminus ssh-key:add ~/.ssh/id_rsa.pub

# 10. Verify SSH key was added (optional)
./terminus ssh-key:list

# 11. Get git clone URL for the site
./terminus connection:info site-name.dev --field=git_url

# 12. Clone the repository
git clone ssh://codeserver.dev.BLAH-BLAH-BLAH.drush.in:2222/~/repository.git

# 13. Create database backup
./terminus backup:create site-name.dev --element=db

# 14. View available backups in JSON format (optional)
./terminus backup:list site-name.dev --format=json | jq .

# 15. Download database backup
./terminus backup:get site-name.dev --element=database --to=site-name-db.sql.gz

# 16. Create files backup
./terminus backup:create site-name.dev --element=files

# 17. Download files backup
./terminus backup:get site-name.dev --element=files --to=site-name-files.tar.gz

