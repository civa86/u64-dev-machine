class apt {
  exec { 'apt-update':
    command => '/usr/bin/apt-get update'
  }
}
