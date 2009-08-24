package MyApp::Command::lossy_load;
use MyApp -command;

use strict;
use warnings;
use Data::Dumper;

sub run 
{
    my ($self, $opt, $args) = @_;

    my $rdb = MySchema::Actor->init_db;

    my @table = $rdb->list_tables;

    my $cm = Rose::DB::Object::ConventionManager->new;
    my $class_prefix = 'MySchema::';

    for my $table (@table) 
    {
	my $obj_class = $class_prefix . $cm->table_to_class($table);
	warn "$obj_class";

	use Class::MOP;

	Class::MOP::load_class($obj_class);

	my @column = $obj_class->meta->columns;

	for my $column (@column)
	{
	    warn "\t$column";
	}
    }

}

sub usage_desc { "app $_[0] \%o last_name_for_like" }

sub opt_spec 
{

}

sub validate_args 
{
    my ($self, $opt, $args) = @_;


}

1;
