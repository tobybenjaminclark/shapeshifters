/// @description Insert description here
// You can write your code in this editor

for(var c = 0; c < global.PlayerScore; c++)
{
	draw_sprite_ext(sprScore, 0, x, y - (c * sprite_get_height(sprScore)), 0.3, 0.3, 0, c_white, 1);
}







