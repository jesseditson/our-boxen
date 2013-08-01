# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen",      "3.0.1"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "autoconf",   "1.0.0"
github "dnsmasq",    "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.2.5"
github "homebrew",   "1.4.1"
github "hub",        "1.0.3"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",      "1.4.2"
github "nodejs",     "3.2.9"
github "openssl",    "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.2.0"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

# utilities
github "property_list_key", "0.1.0"
github "solr",          "1.0.2"
github "libpng",        "1.0.0"
github "heroku",        "2.0.0"
github "java",          "1.1.2"
github "processing",    "1.0.0"
github "python",        "1.2.1"
github "android",       "1.0.0"
github "imagemagick",   "1.2.1"
github "wget",          "1.0.0"

# dbs
github "redis",         "1.0.0"
github "memcached",     "1.2.0"
github "mysql",         "1.1.3"
github "mongodb",       "1.0.4"

# browsers
github "chrome",        "1.1.1"
github "opera",         "0.0.5"
github "firefox",       "1.1.1"

# applications
github "virtualbox",    "1.0.5"
github "sequel_pro",    "1.0.0"
github "evernote",      "2.0.3"
github "skype",         "1.0.3"
github "spotify",       "1.0.1"
github "launchbar",     "1.0.1"
github "vlc",           "1.0.3"
github "dropbox",       "1.1.1"
github "transmission",  "1.0.0"
github "propane",       "1.0.0"
github "airfoil",       "0.0.1"
github "github_for_mac","1.0.1"
github "mou",           "1.1.3"
github "textmate",      "1.1.0"
github "forklift",      "2.5.5", :repo => "jozefizso/puppet-forklift"
github "arduino",       "1.0.1", :repo => "ngs/puppet-arduino"
github "lastfm",        "0.0.2", :repo => "boxelly/puppet-lastfm"

# missing:
# photoshop
# illustrator
# httpscoop
