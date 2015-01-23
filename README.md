Sample PW instance template for new projects
============================================

Comes with simple scripts for installation and updating the lock file. Make sure you have curl in your path and run

```
  ./install.sh
  rm -fr .git
  git init
  git add composer.json composer.lock .profile.d/
  echo update.sh >> .gitignore
  echo install.sh >> .gitignore
  git commit -m "Initial commit"
  cp vendor/sforsman/dhelper/contrib/example_config.json ./config.json
  <edit the configuration>
  vendor/sforsman/dhelper/bin/setup_deis_instance <myinstance> config.json
  git push deis master
```
