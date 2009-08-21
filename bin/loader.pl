#!/usr/bin/perl

use strict; use warnings;
use FindBin;

use vars qw($LIB);

BEGIN {
    $LIB ="$FindBin::Bin/../lib";
}

use lib $LIB;


use MyDB;
use Rose::DB::Object::Loader;



my $loader = Rose::DB::Object::Loader->new
  (
   db           => MyDB->new(type => 'main', domain => 'development'),
   class_prefix => 'MySchema'
  );

$loader->make_modules(module_dir => $LIB);
