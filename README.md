Sample PW instance template for new projects
============================================

Comes with a Deis/Heroku -deployable composer.json and simple scripts for installation and 
updating the lock file. Make sure you have curl in your path and that you have logged into Deis.
If you have not, the world will come crumbling down.

Quickstart
----------

1. Clone this repository
2. Make sure your config.json exists in the repository root (and make sure PHP is in your path)
3. Run

```bash
./quickstart.sh <myappname>
```

The script will remove all the crap from this repository and deploy a new app. You probably want to
add another remote and push the app to your VCS as well.

Manual deployment
-----------------

This is basically useful only if you are deploying an existing app and/or just 
grabbed composer.json from this repo. These are the steps you need to execute

```bash
# Setup composer and download helpers etc
./install.sh

# Make sure that the files needed for deployment are in your repo
git add composer.json composer.lock .profile.d/ .gitignore

# If you need additional deployment actions, just place a deploy.php 
# in the repo root and commit it as well

# Commit changes
git commit -m "Added deployment scripts"

# Copy the configuration template
cp vendor/sforsman/dhelper/contrib/example_config.json ./config.json

# <edit the configuration>

# Create a new Deis app
vendor/bin/setup_deis_instance <myinstance> config.json

# Deploy it!
git push deis master

# <get coffee>

# Check the logs to confirm deployment was successful
deis logs
```
