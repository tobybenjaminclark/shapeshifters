/// @description Insert description here
// You can write your code in this editor

if(global.player_ready == false)
{
	if(player == 1)
	{
		global.player_id = "a";
		global.opponent_id = "b";
	}
	else if(player == 2)
	{
		global.player_id = "b";
		global.opponent_id = "a";
	}

	global.player_ready = "true";
	global.queued_room = rmMatchPose;
}




