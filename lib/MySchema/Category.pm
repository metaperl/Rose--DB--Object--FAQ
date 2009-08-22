package MySchema::Category;

use strict;

use base qw(MySchema::DB::Object::AutoBase1);

__PACKAGE__->meta->setup(
    table   => 'category',

    columns => [
        category_id => { type => 'integer', not_null => 1 },
        name        => { type => 'varchar', default => '', length => 25, not_null => 1 },
        last_update => { type => 'timestamp', not_null => 1 },
    ],

    primary_key_columns => [ 'category_id' ],

    relationships => [
        film_category => {
            class      => 'MySchema::FilmCategory',
            column_map => { category_id => 'category_id' },
            type       => 'one to many',
        },
    ],
);

1;
