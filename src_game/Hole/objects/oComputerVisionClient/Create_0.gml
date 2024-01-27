/// @description Insert description here
// You can write your code in this editor

var type = network_socket_udp;
socket = network_create_socket(type);//no port since the client doesn’t care
//Server IP and port, needed to send packets
remote_ip = "127.0.0.1";
remote_port = 8000;
//Make a buffer to hold packet data
var size = 1024;
var type = buffer_fixed;
var alignment = 1;
send_buffer = buffer_create(size,type,alignment);


buffer_seek(send_buffer, buffer_seek_start,0);
//buffer_write(send_buffer, buffer_u8,1); //id. Use different ones for different msg types
buffer_write(send_buffer, buffer_u8, 1);//mousepos
buffer_write(send_buffer, buffer_string, "hello");//mousepos
network_send_udp(socket,remote_ip,remote_port,send_buffer,buffer_tell(send_buffer));