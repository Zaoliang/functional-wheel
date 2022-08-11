# SUSE's openQA tests
#
# Copyright 2022 SUSE LLC
# SPDX-License-Identifier: FSFAP

# Summary: save ulogs in offline mode 
# Maintainer: QE Core <qe-core@suse.de>
# add this test module to a wheel 

use consoletest;
use testapi;
use utils;
use strict;
use warnings;
use Utils::Logging 'save_ulog';

sub run {
    my ($self) = @_;
    $self->select_serial_terminal;
    my $out = script_output('journalctl --no-pager -axb -o short-precise');
    my $filename = "save_ulog.log";
    save_ulog($out, $filename);
}

1;
