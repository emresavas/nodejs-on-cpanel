# Description
This is a Node.js app example project ready to deploy on cPanel.

# How to Start Node.js App on Cpanel?
* Login to cPanel account.
* Clone this repo to cPanel using "Git Version Control" tool on dashboard.
* If you have a valid .cpanel.yml file cPanel will deploy app files to `/home/user/nodejsapp` directory.
* Visit "Application Manager" on cPanel dashboard.
* Create a new app with a proper endpoint and refer to `/home/user/nodejsapp` directory.
  * Click "Register Application" button.
  * Name your application.
  * Select a domain binded to your cPanel account. (if you want to deploy this app on a subdomain, please create a subdomain first)
  * Assuming you put app files to `/home/user/nodejsapp` please fill this area with `nodejsapp`.
  * Select production.
  * Submit the app with "Deploy" button. This will redirect you to app list page.
  * You will see "Ensure Dependencies" button next to app name. Click this button and start initialization of Node.js app on cPanel.

# Requirements & Notes
* Since Apache on cPanel working as a proxy for Passenger webserver, it will create some default proxy entries with app.js file. Do not change app.js filename. Passenger web server will automatically search for app.js file to start Node.js application. If you name your file let's say myapp.js, Passenger webserver won't able to start your app.

# Auto Deploy to Cpanel
* Change `.cpanel.yml.example` filename to `.cpanel.yml`
* Edit `/home/user/nodejsapp` line in `.cpanel.yml` to your username on cPanel
## Example cpanel.yml File
```yml
---
deployment:
  tasks:
    - export DEPLOYPATH=/home/user/nodejsapp/
    - /bin/mkdir $DEPLOYPATH
    - /bin/cp app.js $DEPLOYPATH
    - /bin/cp packages.json $DEPLOYPATH
    - /bin/mkdir $DEPLOYPATH/tmp
    - /bin/touch $DEPLOYPATH/tmp/restart.txt
```

