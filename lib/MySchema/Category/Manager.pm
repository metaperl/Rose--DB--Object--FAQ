package MySchema::Category::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use MySchema::Category;

sub object_class { 'MySchema::Category' }

__PACKAGE__->make_manager_methods('category');

1;

