use PNGgraph::pie;

print STDERR "Processing sample 9-3\n";

@data = ( 
	[ qw( 1st 2nd 3rd 4th 5th 6th 7th ) ],
	[ sort { $b <=> $a} (5.6, 2.1, 3.03, 4.05, 1.34, 0.2, 2.56) ]
);

$my_graph = new PNGgraph::pie( 200, 200 );

$my_graph->set( 
	start_angle => 90,
	'3d' => 0
);

$my_graph->plot_to_png( "sample93.png", \@data );

exit;

