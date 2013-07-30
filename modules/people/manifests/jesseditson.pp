class people::jesseditson {
  include bash
  include bash::completion
  include solr
  include libpng
  include heroku
  include java
  include processing
  include python
  include android::sdk
  include android::ndk
  include android::10
  include android::11
  include android::12
  include android::13
  include android::14
  include android::15
  include android::16
  include android::17
  include android::platform_tools
  include android::doc
  include android::studio
  include imagemagick
  include wget
  include redis
  include memcached
  include mysql
  include mongodb
  include chrome
  include chrome::canary
  include opera
  include firefox
  include virtualbox
  include sequel_pro
  include evernote
  include skype
  include spotify
  include launchbar
  include vlc
  include dropbox
  include transmission
  include propane
  include airfoil
  include github_for_mac
  include textmate::textmate2::release
  include forklift
  include arduino
  include lastfm

  $home     = "/Users/${::boxen_user}"
  
  #plist changes
  
  # Disable Gatekeeper so you can install any package you want
  property_list_key { 'Disable Gatekeeper':
    ensure => present,
    path   => '/var/db/SystemPolicy-prefs.plist',
    key    => 'enabled',
    value  => 'no',
  }
  # NOTE: Dock prefs only take effect when you restart the dock
  property_list_key { 'Hide the dock':
    ensure     => present,
    path       => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
    key        => 'autohide',
    value      => true,
    value_type => 'boolean',
    notify     => Exec['Restart the Dock'],
  }
  property_list_key { 'Align the Dock Left':
    ensure     => present,
    path       => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
    key        => 'orientation',
    value      => 'left',
    notify     => Exec['Restart the Dock'],
  }
  exec { 'Restart the Dock':
    command     => '/usr/bin/killall -HUP Dock',
    refreshonly => true,
  }
  file { 'Dock Plist':
    ensure  => file,
    require => [
                 Property_list_key['Lower Right Hotcorner - Screen Saver - modifier'],
                 Property_list_key['Hide the dock'],
                 Property_list_key['Align the Dock Left'],
               ],
    path    => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
    mode    => '0600',
    notify     => Exec['Restart the Dock'],
  }
  
  # dotfiles
  
  $config_dir = "${boxen::config::srcdir}/dotfiles"
  
  repository { $config_dir:
    source => "${::github_user}/dotfiles"
  }
  
  define link_dotfiles {
    file { "${home}/${title}":
      ensure => link,
      target => "${config_dir}/dotfiles/${title}",
      require => Repository[$config_dir]
    }
  }
  
  link_dotfiles { [
    ".awssecret",
    ".bash_profile",
    ".bashrc",
    ".eaglerc",
    ".gitconfig",
    ".jshintrc",
    ".netrc",
    ".npmrc",
    ".ssh",
    ".subversion",
    ".tm_properties",
    ".vim",
    ".viminfo",
    ".vimrc",
    ".zprofile",
    ".zshrc"
  ]: }
  
  #TODO: add utilities
  # util script
  # slow/unslow
  
  #TODO: set up proxy
  
  # set up /etc/hosts
  file { "/etc/hosts":
    ensure => link,
    target => "${config_dir}/etc/hosts",
    require => Repository[$config_dir]
  }
  
}