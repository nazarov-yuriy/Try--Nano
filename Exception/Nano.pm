package Exception::Nano;
use strict;
use warnings;

#use only with Try::Nano
sub test {
	my $class = shift;
	return $_->isa( $class );
}

sub throw {
	my $class = shift;
	die bless {}, $class;
}

1;