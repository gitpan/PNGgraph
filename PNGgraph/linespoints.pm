#==========================================================================
#              Copyright (c) 1999 Dmitry Ovsyanko
#--------------------------------------------------------------------------
#
#   Name:
#       PNGgraph::linespoints.pm
#
#==========================================================================

package PNGgraph::linespoints;

use strict qw(vars refs subs);

use PNGgraph::axestype;
use PNGgraph::lines;
use PNGgraph::points;

# Even though multiple inheritance is not really a good idea,
# since lines and points have the same parent class, I will do it here,
# because I need the functionality of the markers and the line types

@PNGgraph::linespoints::ISA = qw( PNGgraph::lines PNGgraph::points );

{
    sub initialise()
    {
        my $s = shift;

        $s->PNGgraph::lines::initialise();
        $s->PNGgraph::points::initialise();
    }

    # PRIVATE

    sub draw_data_set($$$) # GD::Image, \@data, $ds
    {
        my $s = shift;
        my $g = shift;
        my $d = shift;
        my $ds = shift;

        $s->PNGgraph::points::draw_data_set( $g, $d, $ds );
        $s->PNGgraph::lines::draw_data_set( $g, $d, $ds );
    }

    sub draw_legend_marker($$$$) # (GD::Image, data_set_number, x, y)
    {
        my $s = shift;
        my $g = shift;
        my $n = shift;
        my $x = shift;
        my $y = shift;

        $s->PNGgraph::points::draw_legend_marker($g, $n, $x, $y);
        $s->PNGgraph::lines::draw_legend_marker($g, $n, $x, $y);
    }

} # End of package PNGgraph::linesPoints

1;
