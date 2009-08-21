use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Rose::DB::Object::FAQ',
    AUTHOR              => 'Terrence Brannon <metaperl@gmail.com>',
    VERSION_FROM        => 'lib/Rose/DB/Object/FAQ.pm',
    ABSTRACT_FROM       => 'lib/Rose/DB/Object/FAQ.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Rose-DB-Object-FAQ-*' },
);