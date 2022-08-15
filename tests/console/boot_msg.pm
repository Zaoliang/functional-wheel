# Summary: save tmp directory and save to a log file 
# add this unit test module to a wheel 

use strict;
use warnings;
use Mojo::Base 'basetest';
use Mojo::File qw(path);
use Logging 'save_ulog';

sub run {

    my ($out, $filename) = @_;
    $out = system("cat /var/log/messages");
    $filename = 'messages';
    save_ulog($out, $filename);
    print "Writing to $filename successfully!\n" if -e path("ulogs/$filename");
}

1;

