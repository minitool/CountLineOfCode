#!/usr/bin/perl -wnl
BEGIN {
  use strict;
  use File::Find;
  my $ext="js";
  my @dirs=( @ARGV ? @ARGV : '.' );
  @ARGV=();
  find(sub { -f and /\.$ext$/o and push @ARGV, $File::Find::name }, @dirs );
  our ($comment, $blank) = (0, 0);
}

if    ( m{ ^\s*/\* }x .. m{ \*/ }x   or   m{ ^\s*// }x ) { $comment++ }
elsif ( m{ ^\s*$ }x ) { $blank++ }

END {
  print "comment lines: $comment; blank lines: $blank ; total $. lines";
}