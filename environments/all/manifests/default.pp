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
    revision => 'f0880b546bdb35b796600d58eed21fdf9bc5255b',
    require  => Class['git'],
  }
}
