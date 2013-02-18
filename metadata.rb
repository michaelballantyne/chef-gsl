name             "gsl"
maintainer       "Michael Ballantyne"
maintainer_email "michael.ballantyne@gmail.com"
license          "Public Domain"
description      "Installs/Configures gsl-weather-display"
version          "0.1.0"

depends "apache2"
depends "python"

recipe "gsl", "Installs gsl-weather-display with apache vhost and cron job."

supports "ubuntu"
