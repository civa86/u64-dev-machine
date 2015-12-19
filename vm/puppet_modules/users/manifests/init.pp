class users {
  user {"vagrant":
    ensure => present,
    home => "/home/vagrant"
  } -> file {"/home/vagrant":
    ensure => directory,
    owner => vagrant
  }

  user {"root":
    ensure => present,
    home => "/root"
  } -> file {"/root":
    ensure => directory,
    owner => root
  }
}
