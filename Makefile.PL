#--- Distribution section ---

$MODNAME = 'PNGgraph';

BEGIN { require 5.001 }

use ExtUtils::MakeMaker;

my @clean = qw(*% *.html *.b[ac]k *.old .[A-z]* tags);
push @clean, map { "*/$_" } @clean;

WriteMakefile(
        'VERSION_FROM'      => $MODNAME . '.pm',    #finds $VERSION
        'DISTNAME'          => $MODNAME,
        'NAME'              => $MODNAME,

        ($] >= 5.005 ?
            ('ABSTRACT'     => 'Produces PNG graph plots',
             'AUTHOR'       => 'Dmitry Ovsyanko (do@mobile.ru)',
            ) : ()
        ),

        'PREREQ_PM'         => { 'GD' => 0, },

        'dist'              => {
            'COMPRESS'      => 'gzip -9f',
            'SUFFIX'        => 'gz',
        },

        'clean'   => { 'FILES' => join(" ", @clean), },
);

