// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function send_message()
{
	var t_buffer = buffer_create(256, buffer_grow, 1);
	buffer_seek(t_buffer, buffer_seek_start, 0);
	buffer_write(t_buffer , buffer_u16, 1);
	buffer_write(t_buffer , buffer_string,"Hello");
	network_send_packet(client_socket, t_buffer, buffer_tell(t_buffer));
	buffer_delete(t_buffer);
}
