/// @description Insert description here
// You can write your code in this editor

// Main stuff rendering (head & body)
// ------------
// body
draw_sprite_ext(sprBody, 0, x, y, SCALING_FACTOR, SCALING_FACTOR, 0, c_white, 1);
// head
draw_sprite_ext(sprHead, 0, x, (y - 70), SCALING_FACTOR, SCALING_FACTOR, pose.s2h, c_white, 1);
// ------------


// Drawing Arms
// ----------------------------
// Upper arms (biceps)
draw_sprite_ext(sprUpperArm, 0, x - (50), y - (30), SCALING_FACTOR, SCALING_FACTOR, pose.s2le, c_white, 1); // L
draw_sprite_ext(sprUpperArm, 0, x + (50), y - (30), SCALING_FACTOR, SCALING_FACTOR, pose.s2re, c_white, 1); // R

// Right Wrist Calculations
rw_x = (x + 50) + lengthdir_x(80, pose.s2re); // R X
rw_y = (y - 30) + lengthdir_y(80, pose.s2re); // R Y

// Left Wrist Calculations
lw_x = (x - 50) + lengthdir_x(80, pose.s2le); // L X
lw_y = (y - 30) + lengthdir_y(80, pose.s2le); // L Y

// forearms
draw_sprite_ext(sprForearm, 0, lw_x, lw_y, SCALING_FACTOR, SCALING_FACTOR, pose.le2lw, c_white, 1); // L
draw_sprite_ext(sprForearm, 0, rw_x, rw_y, SCALING_FACTOR, SCALING_FACTOR, pose.re2rw, c_white, 1); // R
// -----------------------------




//	Draw Legs
// -------------------
// Draw Thighs
draw_sprite_ext(sprThigh, 0, x - (30), y + (100), SCALING_FACTOR, SCALING_FACTOR, pose.h2lk, c_white, 1); // L
draw_sprite_ext(sprThigh, 0, x + (30), y + (100), SCALING_FACTOR, SCALING_FACTOR, pose.h2rk, c_white, 1); // R

// Right Shin Calculations
rf_x = (x + 30) + lengthdir_x(110, pose.h2rk);  // R X
rf_y = (y + 100) + lengthdir_y(110, pose.h2rk); // R Y


// Left Shin Calculations
lf_x = (x - 30) + lengthdir_x(110, pose.h2lk);  // L X
lf_y = (y + 100) + lengthdir_y(110, pose.h2lk); // L Y

// Draw Left & Right Shin
draw_sprite_ext(sprFoot, 0, lf_x, lf_y, SCALING_FACTOR, SCALING_FACTOR, pose.lk2lf, c_white, 1); // L
draw_sprite_ext(sprFoot, 0, rf_x, rf_y, SCALING_FACTOR, SCALING_FACTOR, pose.rk2rf, c_white, 1); // R

// -------------------




