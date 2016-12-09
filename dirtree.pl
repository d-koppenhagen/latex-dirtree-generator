#!/usr/bin/perl -w
use strict;
use File::Find;
use File::Basename;

my $top = $ARGV[0];
my $min_depth = 0;
my $max_depth = undef;

if($ARGV[1]){
  $max_depth = $ARGV[1];
}


die "specify top directory\n" unless defined $top;
chdir $top or die "cannot chdir to $top: $!\n";

printf "\\dirtree{%%\n";

if($max_depth) {
  find( {
    preprocess => \&preprocess,
    wanted => \&print_results
  }, '.');
} else {
  find(\&print_results, '.');
}

printf "}\\hfill\n";


sub preprocess {
    my $depth = $File::Find::dir =~ tr[/][];
    return @_ if $depth < $max_depth;
    return "\\dots" if $depth == $max_depth;
    return grep { not -d } @_ if $depth == $max_depth;
    return;
}

sub print_results {
    local $_ = $File::Find::name;
    my @F = split '/';
    my $name = $F[-1];
    $name =~ s/_/\\_/g; # replace underscore with "\_"
    my $filename = basename($top, '.');
    printf "  .%d %s.\n", scalar @F, @F==1 ? $filename : $name;
}
