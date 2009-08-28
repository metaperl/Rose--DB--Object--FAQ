#!/usr/bin/perl

use strict; use warnings;
use FindBin;

use vars qw($LIB);

BEGIN {
    $LIB ="$FindBin::Bin/../lib";
}

use lib $LIB;

use Data::Dumper;

use MyDB;

use Rose::DB;
use Rose::DB::Object;
use Rose::DB::Object::ConventionManager;
use Rose::DB::Object::Loader;
use Rose::DB::Object::Metadata::Util qw(perl_hashref);
use Rose::DB::Object::Metadata::Auto;


my $db = MyDB->new(type => 'main', domain => 'development');

my $loader = Rose::DB::Object::Loader->new
  (
   db           => MyDB->new(type => 'main', domain => 'development'),
   class_prefix => 'MySchema'
  );

my @tbl = $loader->make_classes;
die "@tbl";

