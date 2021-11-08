//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/	/*Update Interval*/	/*Update Signal*/
	{"",		"sb-pacman",		0,			1},
	{"",		"sb-torrent",          60,			2},
	{"",		"sb-weather",	     3600,			3},
	//{" CPU:",	"sb-cpu",	       10,			4},
	{"",		"sb-temp",	       10,			5},
	//{"",		"sb-ram",	       60,			6},
	{"",		"sb-battery",	       60,			7},
	{"",		"sb-audio",		0,			8},
	{" ",		"sb-monero",	      300,			9},
	{"💵 $",	"sb-dolar",		0,		       10},
	{"📅 ",		"sb-date",		0,	       	       11},
	{"📶 ",		"sb-wifi",	       10,	               12},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;