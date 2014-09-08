class site::app {

  # Set path for exec tasks
  Exec {
    path => ['/usr/local/node/node-default/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin']
  }

  file { '/home/vagrant/app':
    ensure => symlink,
    target => '/vagrant',
    owner => 'vagrant',
    group => 'vagrant'
  }

  exec { "bundle install":
    command => "chruby-exec ruby-2.1.2 -- bundle install",
    cwd => '/vagrant',
    require => Exec['install_bundler']
  }

  class { 'nodejs':
    version => 'stable',
    make_install => false,
  }

  package { 'grunt-cli':
    provider => npm,
    require => Class['nodejs'],
  }

  package { 'bower':
    provider => npm,
    require => Class['nodejs'],
  }

  exec { "npm install":
    command => "npm install --no-bin-links",
    user => 'vagrant',
    cwd => "/vagrant/scripts/js",
    onlyif => 'npm outdated | grep MISSING > /dev/null',
    require => Class['nodejs'],
  }

  exec { "bower install":
    command => "bower install --config.interactive=false",
    user => 'vagrant',
    cwd => "/vagrant/scripts/js",
    onlyif => 'bower list 2>&1 | grep ENOTFOUND > /dev/null',
    require => [Package['bower'], Exec['npm install']],
  }
}