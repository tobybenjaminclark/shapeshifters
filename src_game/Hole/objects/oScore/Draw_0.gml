/// @description Insert description here
// You can write your code in this editor

for(var c = 0; c < global.player_points1; c++)
{
	draw_sprite_ext(sprScore, 0, x, y - (c * (sprite_get_height(sprScore) * 0.2)), 0.2, 0.2, 0, c_white, 1);
}

for(var c = 0; c < global.player_points2; c++)
{
	draw_sprite_ext(sprScore, 0, x - sprite_get_width(sprScore) * 0.2, y - (c * (sprite_get_height(sprScore) * 0.2)), 0.2, 0.2, 0, c_white, 1);
}


for(var c = 0; c < global.player_points3; c++)
{
	draw_sprite_ext(sprScore, 0,  x + sprite_get_width(sprScore) * 0.2, y - (c * (sprite_get_height(sprScore) * 0.2)), 0.2, 0.2, 0, c_white, 1);
}








