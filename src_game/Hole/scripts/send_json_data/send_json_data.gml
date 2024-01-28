// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information



function send_json_data()
{
    
    player_ready_label = "ready" + global.player_id;
    ds_map_add(global.data_map, player_ready_label, global.player_ready);
    
    opponent_ready_label = "ready" + global.opponent_id;
    ds_map_add(global.data_map, opponent_ready_label, global.opponent_ready);
    
    player_1_accuracy_label = global.player_id + "_1_accuracy";
    ds_map_add(global.data_map, player_1_accuracy_label, global.player_1_accuracy);
    
    player_2_accuracy_label = global.player_id + "_2_accuracy";
    ds_map_add(global.data_map, player_2_accuracy_label, global.player_2_accuracy);
    
    player_3_accuracy_label = global.player_id + "_3_accuracy";
    ds_map_add(global.data_map, player_3_accuracy_label, global.player_3_accuracy);
    
    opponent_1_accuracy_label = global.opponent_id + "_1_accuracy";
    ds_map_add(global.data_map, opponent_1_accuracy_label, global.opponent_1_accuracy);
    
    opponent_2_accuracy_label = global.opponent_id + "_2_accuracy";
    ds_map_add(global.data_map, opponent_2_accuracy_label, global.opponent_2_accuracy);
    
    opponent_3_accuracy_label = global.opponent_id + "_3_accuracy";
    ds_map_add(global.data_map, opponent_3_accuracy_label, global.opponent_3_accuracy);
    
    json_data = json_encode(global.data_map);
    
    show_message(json_data);
    
    var t_buffer = buffer_create(256, buffer_grow, 1);
    buffer_seek(t_buffer, buffer_seek_start, 0);
    buffer_write(t_buffer , buffer_string, json_data);
    network_send_packet(global.data_socket, t_buffer, buffer_tell(t_buffer));
    buffer_delete(t_buffer);
}