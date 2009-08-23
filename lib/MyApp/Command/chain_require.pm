package MyApp::Command::chain_require;
use MyApp -command;

use strict;
use warnings;

sub opt_spec {
    return (
      [ "--single",  "use a single query to get results" ],
      [ "recheck|r",  "recheck all results"       ],
    );
}

sub run 
{    

    my ($self, $opt, $args) = @_;

    my @require = $opt->{single} 
      ? (require_objects => [ 'city.country' ]) 
	: ()
	  ;

    my $as = MySchema::Address::Manager->get_address
      ( 

       query => [ address_id => 1 ] ,
       @require
       
      );

    my $count;
    for my $address (@$as) 
    {
	warn $address->district;
	warn $address->city->{city};
	warn $address->city->country->{country};

    }

}

1;
