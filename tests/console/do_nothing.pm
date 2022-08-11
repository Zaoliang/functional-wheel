# Summary: do nothing really 
# add this unit test module to a wheel 

use strict;
use warnings;
use Mojo::Base 'basetest';

sub run {

    my ($filename) = @_;
    $filename = 'test.log';
    print "$filename\n";
}

1;

