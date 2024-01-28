/// @description Insert description here
// You can write your code in this editor

draw_self();
draw_text(x, y + 80, "opp: " + string(global.opponent_ready));

if(global.player_ready == "true")
{
	draw_text(x, y + 30, "Waiting for Opponent");
}







