//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/	/*Update Interval*/	/*Update Signal*/
	{"",		"sb-pacman",		0,			1},
	{"",		"sb-mail",	       10,		        2},
	{"",		"sb-torrent",          10,			3},
	{"",		"sb-weather",	     3600,			4},
	//{" CPU:",	"sb-cpu",	       10,			5},
	{"",		"sb-temp",	       10,			6},
	//{"",		"sb-ram",	       60,			7},
	{"",		"sb-battery",	       30,			8},
	{"",		"sb-audio",		0,			9},
	{"🪙",		"sb-bitcoin",	      300,		       10},
	{"♦️",		"sb-eth",	      300,		       11},
	{"",		"sb-monero",	      300,		       12},
	{"💵",		"sb-dolar",		0,		       13},
	{"📅 ",		"sb-date",		0,	       	       14},
	{"",		"sb-wifi",	       10,	               15},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
