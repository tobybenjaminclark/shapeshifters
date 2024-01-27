/// @description Insert description here
// You can write your code in this editor


client_socket = network_create_socket(network_socket_tcp);
var server = network_connect_raw(client_socket, "20.0.2.45", 12345);
if server < 0
    {
		show_debug_message("failed to connect to server")
    }
else
    {
		show_debug_message("connected to server")
    }