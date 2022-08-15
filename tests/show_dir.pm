# Summary: show all directories on SUT and save them to a log file 
# add this unit test module to a wheel 

use strict;
use warnings;
use Mojo::Base 'basetest';
use Mojo::File qw(path);
use Logging 'save_ulog';

sub run {

    my ($out, $filename) = @_;
    $out = system("ls -lah");
    $filename = 'show_dir';
    save_ulog($out, $filename);
    print "checking the log:\n";
    system("ls -lah ulogs/$filename");
    system("cat ulogs/$filename");
    print "empty?\n\n\n";
    print "Writing to $filename successfully!\n" if -e path("ulogs/$filename");
}

1;

