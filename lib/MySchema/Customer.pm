package MySchema::Customer;

use strict;

use base qw(MySchema::DB::Object::AutoBase1);

__PACKAGE__->meta->setup(
    table   => 'customer',

    columns => [
        active      => { type => 'integer', default => 1, not_null => 1 },
        address_id  => { type => 'integer', default => '', not_null => 1 },
        create_date => { type => 'datetime', default => '', not_null => 1 },
        customer_id => { type => 'integer', not_null => 1 },
        email       => { type => 'varchar', length => 50 },
        first_name  => { type => 'varchar', default => '', length => 45, not_null => 1 },
        last_name   => { type => 'varchar', default => '', length => 45, not_null => 1 },
        last_update => { type => 'timestamp', not_null => 1 },
        store_id    => { type => 'integer', default => '', not_null => 1 },
    ],

    primary_key_columns => [ 'customer_id' ],

    foreign_keys => [
        address => {
            class       => 'MySchema::Address',
            key_columns => { address_id => 'address_id' },
        },

        store => {
            class       => 'MySchema::Store',
            key_columns => { store_id => 'store_id' },
        },
    ],

    relationships => [
        payment => {
            class      => 'MySchema::Payment',
            column_map => { customer_id => 'customer_id' },
            type       => 'one to many',
        },

        rental => {
            class      => 'MySchema::Rental',
            column_map => { customer_id => 'customer_id' },
            type       => 'one to many',
        },
    ],
);

1;

