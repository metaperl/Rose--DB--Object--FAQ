package MyApp::Command::all_3;
use MyApp -command;

use strict;
use warnings;

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
