class site::packages {
  package { 'build-essential':
    ensure => present
  }

  package { 'ntp':
    ensure => present
  }

  # Remove if not using sqlite
  package { 'libsqlite3-dev':
    ensure => present
  }
}
