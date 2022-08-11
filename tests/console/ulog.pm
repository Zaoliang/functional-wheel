# Summary: write some strings to a log file 
# add this unit test module to a wheel 

use strict;
use warnings;
use Mojo::Base 'basetest';
use Logging_new 'save_ulog';

sub run {

    my ($out, $filename) = @_;
    $out = system("journalctl --no-pager -axb -o short-precise");
    $filename = 'test.log';
    save_ulog($out, $filename);
    print "Writing to $filename successfully!\n";
}

1;

