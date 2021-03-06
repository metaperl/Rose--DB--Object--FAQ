package MySchema::City;

use strict;

use base qw(MySchema::DB::Object::AutoBase1);

__PACKAGE__->meta->setup(
    table   => 'city',

    columns => [
        city_id     => { type => 'integer', not_null => 1 },
        city        => { type => 'varchar', default => '', length => 50, not_null => 1 },
        country_id  => { type => 'integer', default => '', not_null => 1 },
        last_update => { type => 'timestamp', not_null => 1 },
    ],

    primary_key_columns => [ 'city_id' ],

    foreign_keys => [
        country => {
            class       => 'MySchema::Country',
            key_columns => { country_id => 'country_id' },
        },
    ],

    relationships => [
        address => {
            class      => 'MySchema::Address',
            column_map => { city_id => 'city_id' },
            type       => 'one to many',
        },
    ],
);

1;

