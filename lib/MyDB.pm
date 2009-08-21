package MyDB;

use Rose::DB;
our @ISA = qw(Rose::DB);


use MyConf '%SYS_CONF';

# Use a private registry for this class
__PACKAGE__->use_private_registry;

# Register data sources
MyDB->register_db
  (
   domain   => 'development',
   type     => 'main',
   driver   => 'MySQL',
   database => $SYS_CONF{'database'},
   host => $SYS_CONF{host},
   username  => $SYS_CONF{username},
   password  => $SYS_CONF{password},

  );

