use utf8;
package MyApp::Schema::Result::BookAuthor;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::BookAuthor

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<book_author>

=cut

__PACKAGE__->table("book_author");

=head1 ACCESSORS

=head2 book_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 author_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "book_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "author_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</book_id>

=item * L</author_id>

=back

=cut

__PACKAGE__->set_primary_key("book_id", "author_id");

=head1 RELATIONS

=head2 author

Type: belongs_to

Related object: L<MyApp::Schema::Result::Author>

=cut

__PACKAGE__->belongs_to(
  "author",
  "MyApp::Schema::Result::Author",
  { id => "author_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 book

Type: belongs_to

Related object: L<MyApp::Schema::Result::Book>

=cut

__PACKAGE__->belongs_to(
  "book",
  "MyApp::Schema::Result::Book",
  { id => "book_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2025-03-17 19:38:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6pD0JwPUZYet/oTmPfEncw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;

# many_to_many():
#   args:
#     1) Name of relationship bridge, DBIC will create accessor with this name
#     2) Name of has_many() relationship this many_to_many() is shortcut for
#     3) Name of belongs_to() relationship in model class of has_many() above
#   You must already have the has_many() defined to use a many_to_many().
__PACKAGE__->many_to_many(authors => 'book_authors', 'author');

1;
