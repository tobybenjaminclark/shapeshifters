// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information



function send_json_data()
{		   
	dataStruct = {}
	if(global.player_id == "a")
	{
		dataStruct.readya = global.player_ready;
		dataStruct.readyb = global.opponent_ready;
	}
	else if(global.player_id == "b")
	{
		dataStruct.readyb = global.player_ready;
		dataStruct.readya = global.opponent_ready;
	}
	
	if(global.player_id == "a")
	{
		dataStruct.a_1_accuracy = global.player_1_accuracy;
		dataStruct.a_2_accuracy = global.player_2_accuracy;
		dataStruct.a_3_accuracy = global.player_3_accuracy;
		
		dataStruct.b_1_accuracy = global.opponent_1_accuracy;
		dataStruct.b_2_accuracy = global.opponent_2_accuracy;
		dataStruct.b_3_accuracy = global.opponent_3_accuracy;
	}
	else if(global.player_id == "b")
	{
		dataStruct.a_1_accuracy = global.opponent_1_accuracy;
		dataStruct.a_2_accuracy = global.opponent_2_accuracy;
		dataStruct.a_3_accuracy = global.opponent_3_accuracy;
		
		dataStruct.b_1_accuracy = global.player_1_accuracy;
		dataStruct.b_2_accuracy = global.player_2_accuracy;
		dataStruct.b_3_accuracy = global.player_3_accuracy;
	}
	

    json_data = json_stringify(global.data_map);
	show_debug_message(json_data);
    
    var t_buffer = buffer_create(256, buffer_grow, 1);
    buffer_seek(t_buffer, buffer_seek_start, 0);
    buffer_write(t_buffer , buffer_string, json_data);
    network_send_packet(global.data_socket, t_buffer, buffer_tell(t_buffer));
    buffer_delete(t_buffer);
}