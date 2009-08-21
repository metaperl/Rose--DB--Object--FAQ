package MySchema::Country;

use strict;

use base qw(MySchema::DB::Object::AutoBase1);

__PACKAGE__->meta->setup(
    table   => 'country',

    columns => [
        country_id  => { type => 'integer', not_null => 1 },
        country     => { type => 'varchar', default => '', length => 50, not_null => 1 },
        last_update => { type => 'timestamp', not_null => 1 },
    ],

    primary_key_columns => [ 'country_id' ],

    relationships => [
        city => {
            class      => 'MySchema::City',
            column_map => { country_id => 'country_id' },
            type       => 'one to many',
        },
    ],
);

1;

