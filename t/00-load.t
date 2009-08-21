#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Rose::DB::Object::FAQ' );
}

diag( "Testing Rose::DB::Object::FAQ $Rose::DB::Object::FAQ::VERSION, Perl $], $^X" );
