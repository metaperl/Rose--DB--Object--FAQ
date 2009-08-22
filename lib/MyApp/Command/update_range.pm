package MyApp::Command::update_range;
use MyApp -command;

use strict;
use warnings;

sub run 
{
    my ($self, $opt, $args) = @_;

    use Data::Dumper;
    warn Dumper($args); # $args is an arrayref
 
    my $rows_updated = MySchema::Actor::Manager->update_actor
      (
       set   => { last_name => 'Brock' },
       where => 
       [ 
	[ \'actor_id => BETWEEN ? AND ?', @$args ] 
       ] 
      );

    warn "$rows_updated rows updated.";

}

sub usage_desc { "app $_[0] \%o start_id end_id" }

sub opt_spec 
{

}

sub validate_args 
{
    my ($self, $opt, $args) = @_;

    die $self->usage->text unless scalar @$args == 2;
}

1;
