#==========================================================================
#			   Copyright (c) 1995-1998 Martien Verbruggen
#--------------------------------------------------------------------------
#
#	Name:
#		PNGgraph::area.pm
#
# $Id: area.pm,v 2.4 1998/08/18 06:41:05 mgjv Exp $
#
#==========================================================================

package PNGgraph::area;
 
use strict qw(vars refs subs);

use PNGgraph::axestype;

@PNGgraph::area::ISA = qw( PNGgraph::axestype );

{
	# PRIVATE
	sub draw_data_set($$$)  # GD::Image, \@data, $ds
	{
		my $s = shift;		# object reference
		my $g = shift;		# gd object reference
		my $d = shift;		# reference to data set
		my $ds = shift;		# number of the data set

		my $num = 0;

		# Select a data colour
		my $dsci = $s->set_clr( $g, $s->pick_data_clr($ds) );

		# Create a new polygon
		my $poly = new GD::Polygon();

		# Add the first 'zero' point
		my ($x, $y) = $s->val_to_pixel(1, 0, $ds);
		$poly->addPt($x, $y);

		# Add the data points
		my $i;
		for $i (0 .. $s->{numpoints}) 
		{
			next unless (defined $d->[$i]);

			($x, $y) = $s->val_to_pixel($i + 1, $d->[$i], $ds);
			$poly->addPt($x, $y);

			$num = $i;
		}

		# Add the last zero point
		($x, $y) = $s->val_to_pixel($num + 1, 0, $ds);
		$poly->addPt($x, $y);

		# Draw a filled and a line polygon
		$g->filledPolygon($poly, $dsci);
		$g->polygon($poly, $s->{acci});

		# Draw the accent lines
		for $i (1 .. ($s->{numpoints} - 1)) 
		{
			next unless (defined $d->[$i]);

			($x, $y) = $s->val_to_pixel($i + 1, $d->[$i], $ds);
			$g->dashedLine( $x, $y, $x, $s->{zeropoint}, $s->{acci} );
	   }
	}

} # End of package PNGgraph::area
 
1;
