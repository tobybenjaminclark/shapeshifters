/// @description Insert description here
// You can write your code in this editor

y += speed * direction;

if (y <= initial_y - 10 || y >= initial_y + 10)
{
    direction *= -1; // Reverse the direction when reaching the limits
}