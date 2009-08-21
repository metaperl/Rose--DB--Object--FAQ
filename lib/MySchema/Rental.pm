package MySchema::Rental;

use strict;

use base qw(MySchema::DB::Object::AutoBase1);

__PACKAGE__->meta->setup(
    table   => 'rental',

    columns => [
        rental_id    => { type => 'serial', not_null => 1 },
        rental_date  => { type => 'datetime', default => '', not_null => 1 },
        inventory_id => { type => 'integer', default => '', not_null => 1 },
        customer_id  => { type => 'integer', default => '', not_null => 1 },
        return_date  => { type => 'datetime' },
        staff_id     => { type => 'integer', default => '', not_null => 1 },
        last_update  => { type => 'timestamp', not_null => 1 },
    ],

    primary_key_columns => [ 'rental_id' ],

    unique_key => [ 'rental_date', 'inventory_id', 'customer_id' ],

    foreign_keys => [
        customer => {
            class       => 'MySchema::Customer',
            key_columns => { customer_id => 'customer_id' },
        },

        inventory => {
            class       => 'MySchema::Inventory',
            key_columns => { inventory_id => 'inventory_id' },
        },

        staff => {
            class       => 'MySchema::Staff',
            key_columns => { staff_id => 'staff_id' },
        },
    ],

    relationships => [
        payment => {
            class      => 'MySchema::Payment',
            column_map => { rental_id => 'rental_id' },
            type       => 'one to many',
        },
    ],
);

1;

