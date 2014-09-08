class { "site::packages": require => Stage["main"] }

class { "site::ruby": require => Class["site::packages"] }
class { "site::app": require => Class["site::app"] }

class site {
  Exec {
    path => ['/usr/local/sbin', '/usr/local/bin', '/usr/sbin', '/usr/bin', '/sbin', '/bin']
  }

  group { 'puppet':
    ensure => present,
  }

  group { 'vagrant':
    ensure => present
  }

  user { 'vagrant':
    ensure => present,
    home => '/home/vagrant',
    gid => 'vagrant',
    shell => '/bin/bash',
    require => Group['vagrant']
  }

  file { '/home/vagrant':
    ensure => directory,
    owner => 'vagrant',
    group => 'vagrant',
    mode => 0750,
    require => User['vagrant']
  }

  group { 'boilerplate':
    ensure => present
  }

  user { 'boilerplate':
    ensure => present,
    home => '/home/boilerplate',
    gid => 'boilerplate',
    shell => '/bin/bash',
    require => Group['boilerplate']
  }

  file { '/home/boilerplate':
    ensure => directory,
    owner => 'boilerplate',
    group => 'boilerplate',
    mode => 0750,
    require => User['boilerplate']
  }

  file { '/home/vagrant/bin':
    ensure => directory,
    require => File['/home/vagrant'],
    owner => 'vagrant',
    group => 'vagrant'
  }

  group { 'nerdery':
    ensure => present
  }

  user { 'nerdery':
    ensure => present,
    home => '/home/nerdery',
    gid => 'nerdery',
    shell => '/bin/bash',
    groups => ['sudo'],
    require => Group['nerdery']
  }

  file { '/home/nerdery':
    ensure => directory,
    owner => 'nerdery',
    group => 'nerdery',
    mode => 0750,
    require => User['nerdery']
  }

  exec { 'update-locale':
    command => 'update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8',
  }

  class { 'timezone':
    timezone => 'America/Chicago',
  }

  include packages
  include ruby
  include app
}
