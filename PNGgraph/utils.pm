#==========================================================================
#              Copyright (c) 1999 Dmitry Ovsyanko
#--------------------------------------------------------------------------
#
#   Name:
#       PNGgraph::utils.pm
#
#   Description:
#       Package of general utilities.
#
#==========================================================================

package PNGgraph::utils;

use strict qw(vars subs refs);

use vars qw( @EXPORT_OK %EXPORT_TAGS );
require Exporter;

@PNGgraph::utils::ISA = qw( Exporter );

@EXPORT_OK = qw( _max _min _round );
%EXPORT_TAGS = ( all => [qw(_max _min _round)],);

$PNGgraph::utils::prog_name    = 'PNGgraph::utils.pm';
$PNGgraph::utils::prog_rcs_rev = '$Revision: 2.3 $';
$PNGgraph::utils::prog_version =
    ($PNGgraph::utils::prog_rcs_rev =~ /\s+(\d*\.\d*)/) ? $1 : "0.0";

{
    sub _max {
        my ($a, $b) = @_;
        return undef    if (!defined($a) and !defined($b));
        return $a       if (!defined($b));
        return $b       if (!defined($a));
        ( $a >= $b ) ? $a : $b;
    }

    sub _min {
        my ($a, $b) = @_;
        return undef    if (!defined($a) and !defined($b));
        return $a       if (!defined($b));
        return $b       if (!defined($a));
        ( $a <= $b ) ? $a : $b;
    }

    sub _round {
        my($n) = shift;
        sprintf("%.0f", $n);
    }

    sub version {
        $PNGgraph::utils::prog_version;
    }

    $PNGgraph::utils::prog_name;

} # End of package MVU
