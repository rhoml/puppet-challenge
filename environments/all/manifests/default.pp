node default {

  class { '::nginx': }

  file { '/etc/nginx/conf.d/default.conf':
    ensure => 'absent',
    notify => Service['nginx'],
  }

  class { '::git':
    require => Class['::nginx'],
  }

  vcsrepo { '/var/www/default':
    ensure   => 'present',
    provider => 'git',
    source   => 'https://github.com/puppetlabs/exercise-webpage.git',
    revision => 'master',
    require  => Class['git'],
  }
}
