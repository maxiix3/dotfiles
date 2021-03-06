curl -s http://wxdata.weather.com/wxdata/weather/local/NOXX0029?unit=m&dayf=1&cc=* | perl -ne 'use utf8; {chomp;<tmp\>(\d+).*\s.*\s*<t>([^\t]*)<\/t>; my @value; if( $values[1] eq "Sunny" || $values[1] eq "Mostly Sunny" || $values[1] eq "Partly Sunny" || $values[1] eq "Intermittent Clouds" || $values[1] eq "Hazy Sunshine" || $values[1] eq "Hazy Sunshine" || $values[1] eq "Hot") 
{
my $sun = "";
binmode(STDOUT, ":utf8");
print "$sun";
}
if( $values[1] eq "Mostly Cloudy" || $values[1] eq "Cloudy" || $values[1] eq "Dreary (Overcast)" || $values[1] eq "Fog")
{
my $cloud = "";
binmode(STDOUT, ":utf8");
print "$cloud";
}
if( $values[1] eq "Showers" || $values[1] eq "Mostly Cloudy w/ Showers" || $values[1] eq "Partly Sunny w/ Showers" || $values[1] eq "T-Storms"|| $values[1] eq "Mostly Cloudy w/ T-Storms"|| $values[1] eq "Partly Sunny w/ T-Storms"|| $values[1] eq "Rain")
{
my $rain = "";
binmode(STDOUT, ":utf8");
print "$rain";
}
if( $values[1] eq "Windy")
{
my $wind = "";
binmode(STDOUT, ":utf8");
print "$wind";
} 
if($values[1] eq "Flurries" || $values[1] eq "Mostly Cloudy w/ Flurries" || $values[1] eq "Partly Sunny w/ Flurries"|| $values[1] eq "Snow"|| $values[1] eq "Mostly Cloudy w/ Snow"|| $values[1] eq "Ice"|| $values[1] eq "Sleet"|| $values[1] eq "Freezing Rain"|| $values[1] eq "Rain and Snow"|| $values[1] eq "Cold")
{
my $snow = "";
binmode(STDOUT, ":utf8");
print "$rain";
}
if($values[0] eq "Clear" || $values[1] eq "Mostly Clear" || $values[1] eq "Partly Cloudy"|| $values[1] eq "Intermittent Clouds"|| $values[1] eq "Hazy Moonlight"|| $values[1] eq "Mostly Cloudy"|| $values[1] eq "Partly Cloudy w/ Showers"|| $values[1] eq "Mostly Cloudy w/ Showers"|| $values[1] eq "Partly Cloudy w/ T-Storms"|| $values[1] eq "Mostly Cloudy w/ Flurries" || $values[1] eq "Mostly Cloudy w/ Snow")
{
my $night = "";
binmode(STDOUT, ":utf8");
print "$night";
}
print"$value[0]"; }'

