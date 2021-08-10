//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", "sb-weather",						      3600,		9},
	{" CPU:", "sb-cpu",							10,		1},
	{"🌡️", "sensors | grep temp1 | awk '{print $2}' | sed s/+//",		60,		2},
	{"", "sb-ram",								60,		3},
	{"", "sb-battery",							60,		4},
	{"", "sb-audio",							 0,	       10},
	{"XMR:", "monero",						       300,		5},
	{"📅 ", "sb-wifi",					   		30,		6},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
