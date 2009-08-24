#!/usr/bin/perl

use strict; use warnings;
use FindBin;

use vars qw($LIB);

BEGIN {
    $LIB ="$FindBin::Bin/../lib";
}

use lib $LIB;

use Carp;
$SIG{__DIE__} = \*confess;

use MyDB;
use Rose::DB::Object::Loader;

$Rose::DB::Object::Loader::Debug = 1;

my $loader = Rose::DB::Object::Loader->new
  (
   db           => MyDB->new(type => 'leads2', domain => 'development'),
   class_prefix => 'LeadSchema'
  );

$loader->make_modules(module_dir => $LIB);
