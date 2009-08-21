package MySchema::DB::Object::AutoBase1;

use base 'Rose::DB::Object';

use MyDB;

sub init_db { MyDB->new(domain => 'development', type => 'main') }

1;
