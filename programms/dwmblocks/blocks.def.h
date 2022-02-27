//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
//	{" ", "headset_battery",                                       	    30,		0},
//	{" ", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},
//	{"  ", " df -h / | grep \"/\" | awk -F \" \" \'{print $2 \"/\" $3}\'",	30,	0},
	{" ", "volume",					                                    0,		10},
	{" ", "battery_percent",					                        20, 	0},
	{"  ", "date '+%a %b %d'",                         				5,		0},
	{"  ", "date '+%H:%M'",				                            5,		0}
};
//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " \0 ";
static unsigned int delimLen = 5;
