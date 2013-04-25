#!/usr/bin/perl
use strict;
use warnings;
use Exception::Nano;
use Try::Nano;
use CustomExceptions;

try {
	try {
		CustomExceptions::SomeError0->throw();
	} catch { CustomExceptions::SomeError0->test } by {
		print "In another try\n";
	};
} catch { CustomExceptions::SomeError2->test } by {
	print "In try\n";
};