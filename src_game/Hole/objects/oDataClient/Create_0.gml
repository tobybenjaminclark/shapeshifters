/// @description Insert description here
// You can write your code in this editor

i = 0;

global.data_socket = network_create_socket(network_socket_tcp);
var server = network_connect_raw(global.data_socket, "20.0.2.45", 12348);
send_json_data();









