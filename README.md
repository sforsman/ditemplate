Sample PW instance template for new projects
============================================

Comes with simple scripts for installation and updating the lock file. Make sure you have curl in 
your path and that you have logged into Deis. Then run

```bash
# These are not necessary unless you used git clone
rm -fr .git
rm README.md

# Setup composer and download helpers etc
./install.sh

# Create a new repo for your app and add the files required for deployment
git init
git add composer.json composer.lock .profile.d/ .gitignore

# Ignore the scripts in your repo root
echo update.sh >> .gitignore
echo install.sh >> .gitignore

# Commit first version
git commit -m "Initial commit"

# Copy the configuration template
cp vendor/sforsman/dhelper/contrib/example_config.json ./config.json

<edit the configuration>

# Create a new Deis app
vendor/sforsman/dhelper/bin/setup_deis_instance <myinstance> config.json

# Deploy it!
git push deis master

# Check the logs to confirm deployment was successful
deis logs
```
