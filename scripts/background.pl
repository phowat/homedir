#!/usr/bin/env perl

# Crontab entry should look like:
# * * * * * export DISPLAY=:0 ; /home/pedro/scripts/background.pl subgroup1 subgroup2 ... >> /tmp/bg.log 2> /tmp/bg.err

use autodie;
use utf8;
use Data::Dumper;
use Config::Simple;

sub list_dir {
    my $dir = shift;

    opendir my($dh), $dir or die "Couldn't open dir '$dir': $!";
    my @files = readdir $dh;
    closedir $dh;

    shift(@files); # .
    shift(@files); # ..
    return @files;
};

sub get_random_item {
    my @items = @_;

    my $idx = int(rand(scalar @items));
    return $items[$idx];
};

sub set_wallpaper {
    my $wallpaper_name = shift;

# Unity
#    system( "/usr/bin/gsettings", 
#          "set",  "org.gnome.desktop.background",  
#          "picture-uri", "file://".$wallpapers_dir.$wallpaper_name );

# MATE
#    system( "/usr/bin/mateconftool-2", 
#            "--set",  '--type=string', 
#            '/desktop/mate/background/picture_filename', $wallpapers_dir.$wallpaper_name);

# Xmonad
    system("/usr/bin/feh", "--bg-max", $wallpaper_name);
};

my $conf = new Config::Simple('/home/pedro/.bgrc');
my $wallpapers_dir = $conf->param('path');
my $arg_subgroups;
if ($ARGV[0]) {
    my $subgroup = $conf->param($ARGV[rand @ARGV]);
    my @wallpapers = list_dir($wallpapers_dir."/".$subgroup."/");
    my $wallpaper = get_random_item(@wallpapers);
    print "$subgroup/$wallpaper\n";
    set_wallpaper($wallpapers_dir."/".$subgroup."/".$wallpaper);
} else {
    print "No subgroup defined.\n"
}
