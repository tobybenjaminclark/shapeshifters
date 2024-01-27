/// @description Insert description here
// You can write your code in this editor

//check for data
var buffer = async_load[? "buffer"];
buffer_seek(buffer, buffer_seek_start,0);

// read packet :)
var data = buffer_read(buffer, buffer_string);//mousepos
show_debug_message(data)

try
{
	jsonData = json_parse(data)
	var packet_lost = false;
}
catch(e)
{
	show_message("PACKET LOST!");
	return;
}


// Check if the struct has id variable
if variable_struct_exists(jsonData, "lk2lf")
{
    show_debug_message(jsonData.lk2lf);
	global.PlayerPose.lk2lf = jsonData.lk2lf;
}
        
// Check if the struct has id variable
if variable_struct_exists(jsonData, "rk2rf")
{
    show_debug_message(jsonData.rk2rf);
	global.PlayerPose.rk2rf = jsonData.rk2rf;
}

// Check if the struct has id variable
if variable_struct_exists(jsonData, "h2lk")
{
    show_debug_message(jsonData.h2lk);
	global.PlayerPose.h2lk = jsonData.h2lk;
}

// Check if the struct has id variable
if variable_struct_exists(jsonData, "h2rk")
{
    show_debug_message(jsonData.h2rk);
	global.PlayerPose.h2rk = jsonData.h2rk;
}

// Check if the struct has id variable
if variable_struct_exists(jsonData, "s2le")
{
    show_debug_message(jsonData.s2le);
	global.PlayerPose.s2le = jsonData.s2le;
}

// Check if the struct has id variable
if variable_struct_exists(jsonData, "s2re")
{
    show_debug_message(jsonData.s2re);
	global.PlayerPose.s2re = jsonData.s2re;
}

// Check if the struct has id variable
if variable_struct_exists(jsonData, "le2lw")
{
    show_debug_message(jsonData.le2lw);
	global.PlayerPose.le2lw = jsonData.le2lw;
}

// Check if the struct has id variable
if variable_struct_exists(jsonData, "re2rw")
{
    show_debug_message(jsonData.re2rw);
	global.PlayerPose.re2rw = jsonData.re2rw;
}

// Check if the struct has id variable
if variable_struct_exists(jsonData, "s2h")
{
    show_debug_message(jsonData.s2h);
	global.PlayerPose.s2h = jsonData.s2h;
}
        

buffer_seek(send_buffer, buffer_seek_start,0);
buffer_write(send_buffer, buffer_string, "received");
network_send_udp(socket,remote_ip,remote_port,send_buffer,buffer_tell(send_buffer));