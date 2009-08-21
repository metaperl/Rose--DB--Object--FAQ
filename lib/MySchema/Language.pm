package MySchema::Language;

use strict;

use base qw(MySchema::DB::Object::AutoBase1);

__PACKAGE__->meta->setup(
    table   => 'language',

    columns => [
        language_id => { type => 'integer', not_null => 1 },
        name        => { type => 'character', default => '', length => 20, not_null => 1 },
        last_update => { type => 'timestamp', not_null => 1 },
    ],

    primary_key_columns => [ 'language_id' ],

    relationships => [
        film => {
            class      => 'MySchema::Film',
            column_map => { language_id => 'language_id' },
            type       => 'one to many',
        },

        film_objs => {
            class      => 'MySchema::Film',
            column_map => { language_id => 'original_language_id' },
            type       => 'one to many',
        },
    ],
);

1;

