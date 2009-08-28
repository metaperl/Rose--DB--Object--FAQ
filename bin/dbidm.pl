use strict; use warnings;

use DBIx::DataModel::Schema::Generator;

my $host = 'develdb.CyberTechnologyLLC.com';
my $user =  'msweeney';
my $database='sakila';
my $pass='Peach712Python';


my %c = 
  (
   host => $host,
   dsn => "dbi:mysql:database=$database;host=$host",
   user => $user, 
   pass => $pass
  );



my $gen = DBIx::DataModel::Schema::Generator->new(-schema => 'MySchema');
$gen->fromDBI
  (
   $c{dsn}, $c{user}, $c{pass}, { RaiseError => 1 } 
  ) ;
