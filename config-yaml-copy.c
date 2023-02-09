#include<stdio.h>
#include<string.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{	setuid(0);
system("mv /lib/live-installer/configs/config_fullscreen.yaml /lib/live-installer/configs/config.yaml -f");
	
	return 0;

}
