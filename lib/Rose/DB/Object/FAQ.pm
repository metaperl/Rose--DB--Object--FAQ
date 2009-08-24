package Rose::DB::Object::FAQ;     

use warnings;
use strict;


our $VERSION = '0.01';

=head1 NAME

Rose::DB::Object::FAQ - FAQ for the Perl ORM Rose::DB::Object

=head1 AUTHOR

Terrence Brannon, C<< <metaperl at gmail.com> >>

=head1 Programming Questions

=head2 How to see what entire SQL I have produced

  $Rose::DB::Object::Manager::Debug = 1;
  $Rose::DB::Object::Debug = 1;

=head2 How to add custom SQL to a class

C<make_manager_method_from_sql> documented in L<Rose::DB::Object::Manager> does this.

=head2 How to control RDBO error throwing?

L<http://groups.google.com/group/rose-db-object/browse_thread/thread/ad0ebc1e8af314ce#>

=head2 How to augment a table class with methods without losing them on re-gen?

L<http://groups.google.com/group/rose-db-object/browse_thread/thread/f57d435284aa9a84#>

... use module_postamble to "require
My::DB::Whatever::Extra" (or some similarly named module) at the end
of My/DB/Whatever.pm, inside which you'd add methods and possibly even
tweak metadata and re-initialize( C<< replace_existing => 1>> ).  That way you
can regenerate the modules without fear of touching any of your custom
code. 

=head2 How to use your own $dbh factory?

=head2 Query Logging

L<http://groups.google.com/group/rose-db-object/browse_thread/thread/77a77ffb0753ba4b#>


=head1 SQL Generation

=head2 How to get literal SQL

It's documented here:
L<http://search.cpan.org/dist/Rose-DB-Object/lib/Rose/DB/Object/QueryBuilder.pm#query> 

=head2 Subqueries

=head3 Nested subqueries

L<http://groups.google.com/group/rose-db-object/browse_thread/thread/87e59e6d0fab01b0#>

=head3 Correlated subqueries


=head3 example

This is not a good example. It would be better done with C<< get_objects_from_sql >>

L<http://groups.google.com/group/rose-db-object/browse_thread/thread/977fe1f6a92e2e4d#>

Let's generate

  SELECT * FROM prices WHERE NOT EXISTS (the same product with a lower price) 
  SELECT * FROM prices WHERE NOT EXISTS (SELECT * FROM prices p WHERE p.product_id = t1.product_id AND p.price < t1.price)

  $prices =
      Rose::DB::Object::Manager->get_objects(
        object_class => 'Prices',
        clauses =>
        [
          'NOT EXISTS (SELECT * FROM prices p WHERE ' .
          'p.product_id = t1.product_id AND p.price < t1.price)',
        ]); 

Though personally I would just do:

   SELECT price_id, product_id, MIN(price)
   FROM prices 
   GROUP BY product_id
   ORDER BY price

=head1 Optimization

=head2 Reusing database handles

L<http://groups.google.com/group/rose-db-object/browse_thread/thread/ae0c1f2b36c7d02f#>



=head1 BUGS

Please report any bugs or feature requests to C<bug-rose-db-object-faq at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Rose-DB-Object-FAQ>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.


=head1 ACKNOWLEDGEMENTS

Peter Karman (karpet)


=head1 COPYRIGHT & LICENSE

Copyright 2009 Terrence Brannon, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

1; # End of Rose::DB::Object::FAQ
