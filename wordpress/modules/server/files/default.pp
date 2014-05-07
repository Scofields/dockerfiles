
Exec {
    path => [ '/bin', '/usr/bin', '/usr/sbin', '/usr/local/bin', ],
}

exec { 'postfix_domain':
    command => 'sed \'s/##DOMAIN##/$domain/g /etc/postfix/main.cf\'',
}
