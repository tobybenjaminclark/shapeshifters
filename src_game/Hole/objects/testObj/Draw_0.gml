/// @description Insert description here
// You can write your code in this editor

draw_set_font(fntArialRounded);
draw_text(x, y, "TPose : " + string(calc_accuracy(global.PlayerPose, global.TPOSE, 15)));
draw_text(x, y + 20, "Dab : " + string(calc_accuracy(global.PlayerPose, global.DAB, 15)));








