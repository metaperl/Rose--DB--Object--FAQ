package MyApp::Command::last_update;
use MyApp -command;

use strict;
use warnings;

sub run 
{
    my ($self, $opt, $args) = @_;

    my $actor = MySchema::Actor->new(actor_id => $args->[0])->load;


    use Data::Dumper;

    warn Dumper($actor);

    warn join ' ', $actor->first_name, $actor->last_name, $actor->last_update;
}

sub usage_desc { "yourcmd \%o actor_id" }

sub validate_args 
{
    my ($self, $opt, $args) = @_;

    die $self->usage->text unless @$args;
}

1;
