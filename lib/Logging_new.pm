# Copyright 2022 SUSE LLC
# SPDX-License-Identifier: GPL-2.0-or-later

package Logging_new;

use base 'Exporter';
use Exporter;
use strict;
use warnings;
use Mojo::File qw(path);

our @EXPORT_OK = qw(save_ulog);

sub save_ulog {
    my ($out, $filename) = @_;
    mkdir('ulogs') if (!-d 'ulogs');
    path("ulogs/$filename")->spurt($out);    # save the logs to the ulogs directory on the worker directly
}

1;
