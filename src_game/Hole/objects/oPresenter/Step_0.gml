
if(global.speaking == true)
{
	switch(dir)
	{
		case 1:
			y = y - 1;
			if(y < miny)
			{
				dir = 2;
			}
		case 2:
			y = y + 1;
			if(y > maxy)
			{
				dir = 1;
			}
			break;
	}
}
