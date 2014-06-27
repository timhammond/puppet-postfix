# == Class: postfix
#
# Simple class to configure postfix to send mail directly. It's restricted to localhost.
# There's no variables or anything to configure. Just include the class.
#
# === Variables
#
# === Examples
#
# include ::postfix
#
# === Authors
#
# Tim Hammond <hammondt@umd.edu>
#
# === Copyright
#
# Copyright 2014 Tim Hammond
#

class postfix {
  file { '/var/cache/debconf/postfix.preseed' :
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('postfix/postfix.preseed.erb'),
  }

  package { 'postfix':
    ensure       => latest,
    require      => File["/var/cache/debconf/postfix.preseed"],
    responsefile => "/var/cache/debconf/postfix.preseed",
  }

}
