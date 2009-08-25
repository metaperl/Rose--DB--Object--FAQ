#!/bin/env perl     



use FindBin;
use lib "$FindBin::Bin/../lib";

use MyApp;




$Rose::DB::Object::Manager::Debug = 1;
$Rose::DB::Object::Debug = 1;

MyApp->dbic;

