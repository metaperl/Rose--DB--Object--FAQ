package MySchema::Store;

use strict;

use base qw(MySchema::DB::Object::AutoBase1);

__PACKAGE__->meta->setup(
    table   => 'store',

    columns => [
        store_id         => { type => 'integer', not_null => 1 },
        manager_staff_id => { type => 'integer', default => '', not_null => 1 },
        address_id       => { type => 'integer', default => '', not_null => 1 },
        last_update      => { type => 'timestamp', not_null => 1 },
    ],

    primary_key_columns => [ 'store_id' ],

    unique_key => [ 'manager_staff_id' ],

    foreign_keys => [
        address => {
            class       => 'MySchema::Address',
            key_columns => { address_id => 'address_id' },
        },

        manager => {
            class       => 'MySchema::Staff',
            key_columns => { manager_staff_id => 'staff_id' },
            rel_type    => 'one to one',
        },
    ],

    relationships => [
        customer => {
            class      => 'MySchema::Customer',
            column_map => { store_id => 'store_id' },
            type       => 'one to many',
        },

        inventory => {
            class      => 'MySchema::Inventory',
            column_map => { store_id => 'store_id' },
            type       => 'one to many',
        },

        staff => {
            class      => 'MySchema::Staff',
            column_map => { store_id => 'store_id' },
            type       => 'one to many',
        },
    ],
);

1;

