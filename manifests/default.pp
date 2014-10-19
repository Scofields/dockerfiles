Exec {
    path => [ '/usr/bin/', '/bin', '/usr/local/bin/', ],
}

exec { 'apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9':
    user => root,
} ->

exec { 'echo "deb https://get.docker.com/ubuntu docker main" > /etc/apt/sources.list.d/docker.list':
    user => root,
} ->

exec { 'apt-get update':
    user => root,
} ->

package { [
    'lxc-docker',
    'wget',
]:
    ensure => latest,
} ->

user { 'vagrant':
    ensure => present,
    groups => ['docker'],
}
