package Try::Nano;
use Scalar::Util qw(blessed);
use vars qw(@EXPORT @EXPORT_OK $VERSION @ISA);

BEGIN {
	require Exporter;
	@ISA = qw(Exporter);
}
$VERSION = "0.0.0.1";
@EXPORT = @EXPORT_OK = qw(try catch by);

sub try(&;@){
	my ($code, $ref) = @_;
	my $failed;
	$failed = not eval{
		$code->();
		return 1;
	};
	if($failed){
		if(blessed $@){
			my $e = $@;
			my $cathed = 0;
			my $deep = 10;		#maximum catch/by blocks count
			while(defined $ref && !$cathed && $deep){
				if(ref $ref eq 'Try::Nano::Catch' && defined $ref->{following} && ref $ref->{following} eq 'Try::Nano::By'){
					$_ = $e;
					eval{
						if($ref->{code}->()){
							$cathed = 1;
							$ref->{following}->{code}->();
						}
					};
					$ref = $ref->{following}->{following};
				}else{
					die "Something is wrong!!!";
				}
				$deep--;
			}
			die $e unless $cathed;
		}else{
			die $@;
		}
	}
	undef $@;
}

sub catch(&;@){
	my ($code, $ref) = @_;
	return bless {code => $code, following => $ref}, 'Try::Nano::Catch';
}

sub by(&;@){
	my ($code, $ref) = @_;
	return bless {code => $code, following => $ref}, 'Try::Nano::By';
}

1;