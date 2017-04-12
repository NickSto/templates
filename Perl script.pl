#!/usr/bin/env perl
use warnings;
use strict;
use File::Basename;

if (@ARGV && $ARGV[0] =~ m/^-?-h/) {
  my $script_name = basename($0);
  print <<USAGE;
USAGE:
  \$ $script_name arg1 arg2
Put description here.
USAGE
  exit(0);
}