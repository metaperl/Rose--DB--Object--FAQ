package MyApp::Command::darby_last_name;
use MyApp -command;

use strict;
use warnings;

sub run 
{
    my ($self, $opt, $args) = @_;

    use Data::Dumper;
    warn Dumper($opt);

    my $actor = MySchema::Actor->new(%$opt);
    $actor->save;

    warn 'actor id ', $actor->actor_id . ' saved';
}

sub usage_desc { "app $_[0] \%o last_name_for_like" }

sub opt_spec 
{

}

sub validate_args 
{
    my ($self, $opt, $args) = @_;

    die $self->usage->text unless @$args;
}

1;
