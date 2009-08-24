package MyApp::Command::meta;
use MyApp -command;

use strict;
use warnings;

sub run 
{
    my ($self, $opt, $args) = @_;

    use Data::Dumper;
    warn Dumper($opt);

    my @column = MySchema::Actor->meta->columns;

    for my $column (@column) 
    {
	warn $column->name;
    }

}

sub usage_desc { "app $_[0] \%o last_name_for_like" }

sub opt_spec 
{

}

sub validate_args 
{
    my ($self, $opt, $args) = @_;


}

1;
