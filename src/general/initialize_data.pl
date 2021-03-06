#!/opt/local/bin/perl -w
use strict;
use File::Path;
use File::Spec;
use File::Basename;

my @extensions = ( ".nii.gz", ".nii", ".tar.gz", ".tar", ".tar.bz2" );

sub DownloadFiles {
  my $failure = 0;
  foreach my $url ( @_ ) {
    my ($filename, $filebase, $fileext ) = fileparse( $url, @extensions ); 

    if ( ! -s $filename.$fileext ) {
      system( "wget $url" );
    }

    if ( ! -s $filename.$fileext ) {
      print ( "Failed to download: $url\n" );
      $failure = 1;
    }
  }
  return( $failure );
}

# filenames not in links so no checking
sub DownloadLinks {
  foreach my $url ( @_ ) {
    system( "wget $url" );
  }
  return( 0 );
}
  

# Get the MMRR-21 data set
my $kirbybase = "http://www.nitrc.org/frs/downloadlink.php/22";
my @kirbyurls = ();
my @kirbynames = ();
for ( my $i = 1; $i <= 42; $i++) {
  my $id = sprintf( "%02d", $i );
  push( @kirbyurls, $kirbybase.$id );
  push( @kirbynames, "KKI2009-".$id );
}

if ( ! -d "../data/MMRR-21_subjects" ) {

  system( "mkdir ../data/MMRR-21_subjects" );
  if ( DownloadLinks( @kirbyurls ) ) {
    exit 1;
  }
  foreach my $file ( @kirbynames ) {
    system( "mkdir ../data/MMRR-21_subjects/$file" );
    system( "tar jxf ${file}.tar.bz2" );
    system( "rm ${file}.tar.bz2" );
    system( "mv ${file}* ../data/MMRR-21_subjects/${file}/." );
    system( "gzip ../data/MMRR-21_subjects/${file}/*.nii" );
  }  
}

if ( ! -d "../data/MMRR-21_template" ) {
  
  print ( "Get Mindboggle-101 MMRR-21 data\n" );

  # Get the mindboggle MMRR-21 template and manually defined labels
  my @mindboggleurls = ( "http://mindboggle.info/data/mindboggle101/MMRR-21_volumes.tar.gz", "http://mindboggle.info/data/templates/ants/MMRR-21_template.nii.gz", "http://mindboggle.info/data/templates/ants/MMRR-21_head_template.nii.gz" );
  if ( DownloadFiles( @mindboggleurls ) ) {
    exit 1;
  }
  my $mindbogglereadmeurl = "http://mindboggle.info/data/mindboggle101/README.txt";
  if ( DownloadFiles( $mindbogglereadmeurl ) ) {
    exit 1;
  }
  my @mindbogglelabelurl = "http://www.mindboggle.info/data/labels.surface.DKT31.fullnames.txt";
  if ( DownloadFiles( $mindbogglelabelurl ) ) {
    exit 1;
  }

  if ( ! -d "../data/info" ) {
    system( "mkdir ../data/info" );
  }
  system( "mv README.txt ../data/info/mindbogglereadme.txt" );
  system( "mv /labels.surface.DKT31.fullnames.txt ../data/info/." );

  system( "tar xfz MMRR-21_volumes.tar.gz" );
  system( "rm MMRR-21_volumes.tar.gz" );
  system( "mkdir ../data/MMRR-21_template" );
  system( "mv MMRR-21_template.nii.gz ../data/MMRR-21_template/." );
  system( "mv MMRR-21_head_template.nii.gz ../data/MMRR-21_template/." );
  
  for ( my $i = 1; $i <= 42; $i++) {
    my $id = sprintf( "%02d", $i );

    my @mbID = `cat ../data/info/mindbogglereadme.txt | grep KKI2009-${id}`;
    chomp(@mbID);
    if ( scalar(@mbID) > 0 ) {
      my @mbHash = split( " ",$mbID[0] );
      print ( "$mbHash[0] -> $mbHash[1] \n" );
      my $mbName = $mbHash[0];
      my $mmrrName = $mbHash[1];

      my @mbfiles = glob( "MMRR-21_volumes/${mbName}/*.nii.gz" );
      foreach my $file ( @mbfiles ) {
        chomp($file);
        my ($filename, $filedir ) = fileparse( $file );
        chomp($filename);
        system( "cp $file ../data/MMRR-21_subjects/${mmrrName}/${mmrrName}-$filename" );
      }

    }
  }
  system( "rm -Rf MMRR-21_volumes" );
}

# Sometimes it's convenient to have a subject/timepoint directory structure
# so we set up links for that here
if ( ! -d "../data/MMRR-21_ids" ) {
  system( "mkdir ../data/MMRR-21_ids" );
  
  # subject ids, listed according to acquisition id
  my @ids = (849,934,679,906,913,142,127,742,422,815,906,239,916,959,814,505,959,492,239,142,815,679,800,916,849,814,800,656,742,113,913,502,113,127,505,502,934,492,346,656,346,422);

  my $count = 1;
  foreach my $id (@ids) {
    if ( ! -d "../data/MMRR-21_ids/$id" ) {
      system( "mkdir ../data/MMRR-21_ids/$id" );
    }
    my $timeid = sprintf( "%02d", $count );
    system( "ln -s ../../MMRR-21_subjects/KKI2009-${timeid} ../data/MMRR-21_ids/${id}/${timeid}" );
    $count++;
  }
}




