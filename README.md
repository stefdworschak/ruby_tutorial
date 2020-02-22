# ruby_tutorial

## Installing Rails

### Make sure Ruby and Node.js are installed

`ruby -v`
`node -v`

### Configure Ruby Gem

`gem update --system`

### Install Rails

`gem install rails -v 5.2.0`

### Install any custom GEMs that are in the projects
For example the isprime GEM

`gem i isprime/isprime-0.0.1.gem`

### Update bundler and run it

`gem i bundler -v 1.17.3`
`bundle i`

## Allow hosts

Add the following line to your `application.rb` file

`config.hosts << "[HOSTNAME]"`
