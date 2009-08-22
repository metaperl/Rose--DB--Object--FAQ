package MyApp::Command::chain_require;
use MyApp -command;

use strict;
use warnings;

sub run 
{
    my $as = MySchema::Address::Manager->get_address
      ( 

       query => [ address_id => 1 ] ,
       required_objects => [ 'city.country' ]
       
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
