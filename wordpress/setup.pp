
Exec {
    path => [ '/usr/bin/', '/bin', '/usr/local/bin/', '/usr/sbin/', ],
}

exec { 'apt-get update':
    user => root,
} ->

package { [
    'git',
    'docker.io',
    'cgroup-lite',
    'haproxy',
    'redir',
    'htop',
    'wget',
    ]:
    ensure => latest,
}

file { ['/var/cache/puppet/', '/containers/']:
    ensure => directory,
}

exec { 'enable_memory_swap':
    command => 'sed \'s/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"/g\' /etc/default/grub > /etc/default/grub && touch /var/cache/puppet/enable_memory_swap',
    creates => '/var/cache/puppet/enable_memory_swap',
    user    => root,
    require => File['/var/cache/puppet/'],
}

exec { 'update-grub':
    command => 'update-grub && touch /var/cache/puppet/update-grub',
    creates => '/var/cache/puppet/update-grub',
    user    => root,
    require => File['/var/cache/puppet/'],
}

exec { 'set_lxc_driver':
    command => 'sed \'s/#DOCKER_OPTS="/DOCKER_OPTS="-e lxc /g\' /etc/default/docker.io > /etc/default/docker.io && touch /var/cache/puppet/set_lxc_driver',
    creates => '/var/cache/puppet/set_lxc_driver',
    user    => root,
    require => [File['/var/cache/puppet/'], Package['docker.io']],
}

exec { 'enable_haproxy':
    command => 'sed \'s/ENABLED=0/ENABLED=1/g\' /etc/default/haproxy > /etc/default/haproxy && touch /var/cache/puppet/enable_haproxy',
    creates => '/var/cache/puppet/enable_haproxy',
    user    => root,
    require => [File['/var/cache/puppet/'], Package['haproxy']],
}

exec { 'enable_bin_false':
    command => 'echo "/bin/false" >> /etc/shells',
    unless  => 'grep /bin/false /etc/shells 2>/dev/null',
    user    => root,
}

exec { 'download_wordpress':
    command => 'wget -q --output-document=/containers/wordpress.zip http://de.wordpress.org/wordpress-3.9-de_DE.zip',
    creates => '/containers/wordpress.zip',
    user    => root,
    require => [File['/var/cache/puppet/', '/containers/'], Package['wget']],
}

service { 'haproxy':
    ensure  => running,
    enable  => true,
    require => Package['haproxy'],
}
