// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function receive_message()
{
	var n_id = ds_map_find_value(async_load, "id");
	if server_socket == n_id
	{
		var t_buffer = ds_map_find_value(async_load, "buffer"); 
		var cmd_type = buffer_read(t_buffer, buffer_u16 );
		var inst = ds_map_find_value(socket_list, sock );
		switch (cmd_type)
		{
			case POSE:
	            break;
		}
	}
}
