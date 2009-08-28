package MyApp::Command::all_3;
use MyApp -command;

use strict;
use warnings;


sub run { 
    my ($self, $opt, $args) = @_; 
    my $method = shift @$args; $self->$method($opt, $args); 
}

sub dbic
{
    warn 'dbix class';
}

sub datmo
{
    warn 'dbix::datamodel';
}

sub rdbo
{
    warn 'rose';
}

1;
