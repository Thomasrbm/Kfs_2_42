
#include "cmds.h"


void clear()
{
	for (int i = 0; i < (BUFFER_LINES * VGA_WIDHT); i++)
	{
		g_backbuffer[g_screen][i] = (WHITE_ON_BLACK << 8) | ' ';
	}
}