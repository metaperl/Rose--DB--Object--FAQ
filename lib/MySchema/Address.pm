package MySchema::Address;

use strict;

use base qw(MySchema::DB::Object::AutoBase1);

__PACKAGE__->meta->setup(
    table   => 'address',

    columns => [
        address_id  => { type => 'integer', not_null => 1 },
        address     => { type => 'varchar', default => '', length => 50, not_null => 1 },
        address2    => { type => 'varchar', length => 50 },
        district    => { type => 'varchar', default => '', length => 20, not_null => 1 },
        city_id     => { type => 'integer', default => '', not_null => 1 },
        postal_code => { type => 'varchar', length => 10 },
        phone       => { type => 'varchar', default => '', length => 20, not_null => 1 },
        last_update => { type => 'timestamp', not_null => 1 },
    ],

    primary_key_columns => [ 'address_id' ],

    foreign_keys => [
        city => {
            class       => 'MySchema::City',
            key_columns => { city_id => 'city_id' },
        },
    ],

    relationships => [
        customer => {
            class      => 'MySchema::Customer',
            column_map => { address_id => 'address_id' },
            type       => 'one to many',
        },

        staff => {
            class      => 'MySchema::Staff',
            column_map => { address_id => 'address_id' },
            type       => 'one to many',
        },

        store => {
            class      => 'MySchema::Store',
            column_map => { address_id => 'address_id' },
            type       => 'one to many',
        },
    ],
);

1;

