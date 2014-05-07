
Exec {
    path => [ '/bin', '/usr/bin', '/usr/sbin', '/usr/local/bin', ],
}

exec { 'postfix_domain':
    command => 'sed \'s/##DOMAIN##/$domain/g /etc/postfix/main.cf\'',
}

file { '/mails/valiases':         source => 'puppet:///postfix/valiases', }
exec { 'postmap /mails/valiases': user => root, require => File['/mails/valiases'], }

file { '/mails/vhosts':           source => 'puppet:///postfix/vhosts', }
exec { 'postmap /mails/vhosts':   user => root, require => File['/mails/vhosts'], }

file { '/mails/vmaps':            source => 'puppet:///postfix/vmaps', }
exec { 'postmap /mails/vmaps':    user => root, require => File['/mails/vmaps'], }

file { '/mails/passwd':           source => 'puppet:///dovecot/passwd', }
file { '/mails/users':            source => 'puppet:///dovecot/users', }
