class site::app {
  exec { "bundle install":
    command => "chruby-exec ruby-2.1.2 -- bundle install",
    cwd => '/vagrant',
    require => Exec['install_bundler']
  }
}