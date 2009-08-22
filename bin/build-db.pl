#!/bin/env perl

use strict;
use warnings;


use IO::Prompt;

my %cred;

get_creds();
trim_creds();
load_sakila();

sub trim_creds 
{
    while (my ($k,$v) = each %cred) 
    {
	$v =~ s/\s+//g;
	$cred{$k} = $v;
    }
}

sub get_creds {

print <<'EOTEXT' . "\n";
Now you will be prompted for the following MySQL credentials:
hostname, username, password.

These will be written to a file called 'local.conf'
and then used to create a database named 'sakila' on the 
MySQL server.
EOTEXT

prompt("Hit return to begin. ", );



prompt("hostname for MySQL server: ", '-d' => 'localhost');
$cred{host}=$_;

prompt("username: ", );
$cred{username}=$_;

prompt("password: ", );
$cred{password}=$_;

use Data::Dumper;
warn Dumper(\%cred);

open F, ">local.conf" or die $!;

print F <<"EOTEXT";
CLASS MyConf
host     =  $cred{host}
username = "$cred{username}"
password = "$cred{password}"
EOTEXT

}

sub load_sakila {
 
    for my $file (map "tmp/sakila-db/$_", qw(sakila-schema.sql sakila-data.sql)) 
    {
	my @system = ('mysql', "--host=$cred{host}", "--user=$cred{username}", "--password=$cred{password} < $file");
	print "\n@system\n";
	system(@system);
    }

    print "\nNow run the above two commands to create and load the sakila database (it does not run from this script for some reason\n";

   
}
