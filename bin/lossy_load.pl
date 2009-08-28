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
use Rose::DB::Object::Metadata::Util qw(perl_hashref);
use Rose::DB::Object::Metadata::Auto;


my $db = MyDB->new(type => 'main', domain => 'development');

my @tbl = $db->make_modules;
die "@tbl";

my @table = $db->list_tables;

warn Dumper(\@table);

my $cm = Rose::DB::Object::ConventionManager->new;
my $class_prefix = 'Test::';

for my $table (@table) 
{
    my $obj_class = $class_prefix . $cm->table_to_class($table);

    next if class_already_created($obj_class);
    
    setup_class 
      (
       $table, $obj_class, \@base_classes, $init_db, $db,
       $pre_init_hook, $post_init_hook, $convention_manager,
       $args
       );
}

sub class_already_created {
    my ($obj_class)=@_;
    
    no strict 'refs';
    ($obj_class->isa('Rose::DB::Object') && $obj_class->meta->is_initialized);
}

sub setup_class 
{
    my ($table, $obj_class, $base_classes, $init_db, $db,
	$pre_init_hook, $post_init_hook, $convention_manager,
	$args) = @_;

    
    @{"${obj_class}::ISA"} = @base_classes;

    unless($extra_info->{'init_db_in_base_class'})
    {
      *{"${obj_class}::init_db"} = $init_db;
    }

    my $meta = $obj_class->meta;

    $meta->db($db);

    if($pre_init_hook)
    {
      if(ref $pre_init_hook eq 'CODE')
      {
        $pre_init_hook = [ $pre_init_hook ];
      }
      elsif(ref $pre_init_hook ne 'ARRAY')
      {
        Carp::croak "Invalid pre_init_hook: $pre_init_hook";
      }
    }

    unshift(@$pre_init_hook, sub { $self->default_pre_init_hook(@_) });

    $meta->pre_init_hook($pre_init_hook);

    if($post_init_hook)
    {
      if(ref $post_init_hook eq 'CODE')
      {
        $post_init_hook = [ $post_init_hook ];
      }
      elsif(ref $post_init_hook ne 'ARRAY')
      {
        Carp::croak "Invalid post_init_hook: $post_init_hook";
      }
    }

    unshift(@$post_init_hook, sub { $self->default_post_init_hook(@_) });

    $meta->post_init_hook($post_init_hook);

    $meta->table($table);
    $meta->convention_manager($cm->clone);
    $meta->db($db);

    my $include_predicated_unique_indexes = 
      exists $args{'include_predicated_unique_indexes'} 
        ? delete $args{'include_predicated_unique_indexes'} 
        : $self->include_predicated_unique_indexes;

    $meta->include_predicated_unique_indexes($include_predicated_unique_indexes);

    $meta->auto_initialize(%args);



}
