package MyApp::Command::add_actor;
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

sub usage_desc { "yourcmd \%o actor_id" }

sub opt_spec 
{
    ( 
      ["first_name=s", "first name"],
      ["last_name=s", "last name"],
      )
}

sub validate_args 
{
    my ($self, $opt, $args) = @_;

    #die $self->usage->text unless @$args;
}

1;
