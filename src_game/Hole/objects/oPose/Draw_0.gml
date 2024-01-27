/// @description Insert description here
// You can write your code in this editor

// body
draw_circle(x, y, 20, false);

// head
draw_sprite_ext(sprHead, 0, x, (y - 100), 0.5, 0.5, pose.s2h, c_white, 1);

// arms
draw_sprite_ext(sprUpperArm, 0, x - (100), y - (50), 0.8, 0.8, pose.s2le, c_white, 1);
draw_sprite_ext(sprUpperArm, 0, x + (100), y - (50), 0.8, 0.8, pose.s2re, c_white, 1);

// forearms
draw_sprite_ext(sprForearm, 0, x - (200), y - (50), 0.8, 0.8, pose.le2lw, c_white, 1);
draw_sprite_ext(sprForearm, 0, x + (200), y - (50), 0.8, 0.8, pose.re2rw, c_white, 1);

// thighs
draw_sprite_ext(sprThigh, 0, x - (60), y + (150), 0.8, 0.8, pose.h2lk, c_white, 1);
draw_sprite_ext(sprThigh, 0, x + (60), y + (150), 0.8, 0.8, pose.h2rk, c_white, 1);

// shins
draw_sprite_ext(sprFoot, 0, x - (60), y + (300), 0.8, 0.8, pose.lk2lf, c_white, 1);
draw_sprite_ext(sprFoot, 0, x + (60), y + (300), 0.8, 0.8, pose.rk2rf, c_white, 1);


/*
draw_sprite(sprBody, 0, x, y);

// Head
draw_sprite(sprHead, 0, x, (y - (2*sprite_height)));

// Draw Upper Arms
draw_sprite(sprUpperArm, 0, x - (sprite_width), y - (sprite_height))
draw_sprite(sprUpperArm, 0, x + (sprite_width), y - (sprite_height))


// Left & Right Thigh
draw_sprite(sprThigh, 0, x - (sprite_width), y + (sprite_height))
draw_sprite(sprThigh, 0, x + (sprite_width), y + (sprite_height))
*/







