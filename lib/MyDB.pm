package MyDB;

use Rose::DB;
our @ISA = qw(Rose::DB);


use MyConf '%SYS_CONF';

warn $SYS_CONF{'database'}; 
warn $SYS_CONF{'username'};
warn $SYS_CONF{'host'}; 
warn $SYS_CONF{'password'};

# Use a private registry for this class
__PACKAGE__->use_private_registry;

# Register data sources
MyDB->register_db
  (
   domain   => 'development',
   type     => 'main',
   driver   => 'MySQL',
   %SYS_CONF
  );

