class nodeglobal ($node_modules = []) {
  # NODE JS EXECUTABLE SYMLINK
  file { '/usr/bin/node':
    ensure => 'link',
    target => '/usr/bin/nodejs',
    require => Package['npm', 'nodejs']
  }

  #GLOBAL NODE MODULES
  package { $node_modules:
    ensure   => 'present',
    provider => 'npm',
    require => Package['npm', 'nodejs']
  }
}

