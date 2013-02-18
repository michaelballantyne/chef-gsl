# chef-gsl
This cookbook installs and configures https://github.com/michaelballantyne/gsl-weather-display.

## Attributes
* `node['gsl']['servername']` - ServerName for use in Apache vhost
* `node['gsl']['directory']` - Directory to install to

Neither of these has a default value - both must be provided.

## Recipes
### default
Checks out the app, creates a python virtualenv, creates an apache virtual host, and adds a cron job to run every 5 minutes.
