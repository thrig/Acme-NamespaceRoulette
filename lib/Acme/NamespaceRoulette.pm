package Acme::NamespaceRoulette;

use 5.008000;
use strict;
no strict 'refs';
use warnings;

require Exporter;
our @ISA    = qw(Exporter);
our @EXPORT = qw(AUTOLOAD);

use Symbol;
use POSIX;

our $VERSION = '3.45';

sub AUTOLOAD {
  my @names = grep { /^(?:\w+|\w+::\w+)$/ } keys %::;
  my $rand = qualify( $names[ rand @names ] );
  $rand =~ s/Acme::NamespaceRoulette/main/;
  goto &$rand;
}

1;
__END__

=head1 NAME

Acme::NamespaceRoulette - automatic namespace typo handling

=head1 SYNOPSIS

  use Acme::NamespaceRoulette;
  # are you feeling lucky?

=head1 DESCRIPTION

This module does nothing (except for screw around with AUTOLOAD, which
might well break anything that depends on that), unless a typo is made
with a function name, in which case some random other thingy from the
symbol table is instead called.

=head1 AUTHOR

Jeremy Mates, E<lt>jmates@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013 by Jeremy Mates

This library is free software; you can redistribute it and/or modify it
under the same terms as Perl itself, either Perl version 5.16 or, at
your option, any later version of Perl 5 you may have available.

=cut
