# Summary: write some strings to a log file 
# add this unit test module to a wheel 

use strict;
use warnings;
use Mojo::Base 'basetest';

sub run {

    my ($str, $filename) = @_;
    $str = <<EOF;
    This is the sample text
    that is used to write to file
EOF

    $filename = 'string2log';
    open(FH, '>', $filename) or die $!;
    print FH $str;
    close(FH);

    print "Writing to file successfully!\n" if -e $filename;
}

1;

