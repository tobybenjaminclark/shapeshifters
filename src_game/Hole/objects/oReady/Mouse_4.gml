/// @description Insert description here
// You can write your code in this editor

if(global.player_ready == false)
{
	if(player == "A")
	{
		global.player_id = "A";
		global.opponent_id = "B";
	}
	else if(player == "B")
	{
		global.player_id = "B";
		global.opponent_id = "A";
	}

	global.player_ready = true;
	global.queued_room = rmMatchPose;
}




