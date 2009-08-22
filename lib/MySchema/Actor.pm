package MySchema::Actor;

use strict;

use base qw(MySchema::DB::Object::AutoBase1);

__PACKAGE__->meta->setup(
    table   => 'actor',

    columns => [
        actor_id    => { type => 'integer', not_null => 1 },
        first_name  => { type => 'varchar', default => '', length => 45, not_null => 1 },
        last_name   => { type => 'varchar', default => '', length => 45, not_null => 1 },
        last_update => { type => 'timestamp', not_null => 1 },
    ],

    primary_key_columns => [ 'actor_id' ],
);

1;

