package MySchema::FilmActor;

use strict;

use base qw(MySchema::DB::Object::AutoBase1);

__PACKAGE__->meta->setup(
    table   => 'film_actor',

    columns => [
        actor_id    => { type => 'integer', not_null => 1 },
        film_id     => { type => 'integer', not_null => 1 },
        last_update => { type => 'timestamp', not_null => 1 },
    ],

    primary_key_columns => [ 'actor_id', 'film_id' ],

    foreign_keys => [
        actor => {
            class       => 'MySchema::Actor',
            key_columns => { actor_id => 'actor_id' },
        },

        film => {
            class       => 'MySchema::Film',
            key_columns => { film_id => 'film_id' },
        },
    ],
);

1;

