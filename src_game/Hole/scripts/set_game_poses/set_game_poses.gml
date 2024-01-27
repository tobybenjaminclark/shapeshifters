// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_game_poses(jsonData)
{

    // Check if the struct has id variable
    if variable_struct_exists(jsonData, "lk2lf")
    {
        if(jsonData.lk2lf != -1) global.OtherPlayerPose.lk2lf = jsonData.lk2lf;
    }

    // Check if the struct has id variable
    if variable_struct_exists(jsonData, "rk2rf")
    {
        if(jsonData.rk2rf != -1) global.OtherPlayerPose.rk2rf = jsonData.rk2rf;
    }

    // Check if the struct has id variable
    if variable_struct_exists(jsonData, "h2lk")
    {
        if(jsonData.h2lk != -1) global.OtherPlayerPose.h2lk = jsonData.h2lk;
    }

    // Check if the struct has id variable
    if variable_struct_exists(jsonData, "h2rk")
    {
        if(jsonData.h2rk != -1) global.OtherPlayerPose.h2rk = jsonData.h2rk;
    }

    // Check if the struct has id variable
    if variable_struct_exists(jsonData, "s2le")
    {
        if(jsonData.s2le != -1) global.OtherPlayerPose.s2le = jsonData.s2le;
    }

    // Check if the struct has id variable
    if variable_struct_exists(jsonData, "s2re")
    {
        if(jsonData.s2re != -1) global.OtherPlayerPose.s2re = jsonData.s2re;
    }

    // Check if the struct has id variable
    if variable_struct_exists(jsonData, "le2lw")
    {
        if(jsonData.le2lw != -1) global.OtherPlayerPose.le2lw = jsonData.le2lw;
    }

    // Check if the struct has id variable
    if variable_struct_exists(jsonData, "re2rw")
    {
        if(jsonData.re2rw != -1) global.OtherPlayerPose.re2rw = jsonData.re2rw;
    }

    // Check if the struct has id variable
    if variable_struct_exists(jsonData, "s2h")
    {
        if(jsonData.s2h != -1) global.OtherPlayerPose.s2h = jsonData.s2h;
    }

    // Check if the struct has id variable
    if variable_struct_exists(jsonData, "s2w")
    {
        if(jsonData.s2h != -1) global.OtherPlayerPose.s2w = jsonData.s2w;
    }
}