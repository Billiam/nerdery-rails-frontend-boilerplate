class site::packages {

  package { 'build-essential':
    ensure => present
  }

  package { 'ntp':
    ensure => present
  }

  package { 'nodejs-legacy':
    ensure => present
  }

  # Remove if not using sqlite
  package { 'libsqlite3-dev':
    ensure => present
  }

  package { 'npm':
    ensure => present,
    require => Package['nodejs-legacy']
  }

  exec { 'install grunt':
    command => 'npm install --global grunt-cli',
    unless => 'which grunt 2>/dev/null',
    require => Package['npm']
  }
}
