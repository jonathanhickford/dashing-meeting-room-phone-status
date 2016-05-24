# Meeting Room Phone Dashboard

A simple dashboard that pings the IP addresses of the telephones in a set of defined meeting rooms.  Goes red if the phone is offline.  Assumes phones have static IPs.

# Installation

You'll need installed

 - Ruby (I'm using 2.0.0p451, but the latest 2+ should work)

Before running the first time you need to install the ruby dependencies.  From the root of this project

  ```
  $ gem install bundler
  $ bundle install
  ```
# Configuration

 - Open phones.csv
 - Add lines in the format of <Name of Phone>,<IP Address>

  
## How to run the dashboard

 - Change directory to the root of this project
  ```
  $ rackup
  ```
 - Open a web browser on the url given ( probably http://localhost:9292)
  
  