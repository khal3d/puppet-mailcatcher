class mailcatcher {
    exec { 'install-ruby-dev-libsqlite3-dev':
        command => 'apt-get install ruby-dev && apt-get install libsqlite3-dev'
    }

    exec { 'install-mailcatcher':
        command => 'gem install mailcatcher',
        require => Exec['install-ruby-dev-libsqlite3-dev'],
    }

    exec { 'run-mailcatcher':
        command => 'mailcatcher',
        require => Exec['install-mailcatcher'],
    }
}