package Test::Builder::Event::Bail;
use strict;
use warnings;

use base 'Test::Builder::Event';

sub reason { $_[0]->{reason} }

sub init {
    my ($self, $context, $reason) = @_;
    $self->{reason} = $reason;
}

sub to_tap {
    my $self = shift;
    return "Bail out!  " . $self->reason . "\n";
}

1;

__END__

=head1 NAME

Test::Builder::Event::Bail - Bailout!

=head1 DESCRIPTION

Sent when the test needs to bail out.

=head1 METHODS

See L<Test::Builder::Event> which is the base class for this module.

=head2 CONSTRUCTORS

=over 4

=item $r = $class->new(...)

Create a new instance

=back

=head2 SIMPLE READ/WRITE ACCESSORS

=over 4

=item $r->reason

Reason for the bailout.

=item $r->trace

Get the test trace info, including where to report errors.

=item $r->pid

PID in which the event was created.

=item $r->depth

Builder depth of the event (0 for normal, 1 for subtest, 2 for nested, etc).

=item $r->in_todo

True if the event was generated inside a todo.

=item $r->source

Builder that created the event, usually $0, but the name of a subtest when
inside a subtest.

=back

=head2 INFORMATION

=over 4

=item $r->to_tap

Returns the TAP string for the plan (not indented).

=item $r->type

Type of event. Usually this is the lowercased name from the end of the
package. L<Test::Builder::Event::Ok> = 'ok'.

=item $r->indent

Returns the indentation that should be used to display the event ('    ' x
depth).

=back

=head1 AUTHORS

=over 4

=item Chad Granum E<lt>exodist@cpan.orgE<gt>

=back

=head1 SOURCE

The source code repository for Test::More can be found at
F<http://github.com/Test-More/test-more/>.

=head1 COPYRIGHT

Copyright 2014 Chad Granum E<lt>exodist7@gmail.comE<gt>.

This program is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

See F<http://www.perl.com/perl/misc/Artistic.html>
