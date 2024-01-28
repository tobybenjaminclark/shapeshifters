//check for data
var buffer = async_load[? "buffer"];
buffer_seek(buffer, buffer_seek_start,0);

// read packet 🙂
var data = buffer_read(buffer, buffer_string);//mousepos

try
{
    jsonData = json_parse(data)
    var packet_lost = false;
}
catch(e)
{
    return;
}

if(variable_struct_exists(jsonData, "cv"))
{
    switch jsonData.cv
    {
        case true:
            send_tcp_poses(jsonData);
            break
        case false:
            set_game_poses(jsonData);
            break
    }
}
else
{
	// data json
	// parse the data
	
	if(variable_struct_exists(jsonData, "a_1_accuracy"))
	{
		if(global.player_id == "a")
		{
			global.player_1_accuracy = jsonData.a_1_accuracy;
		}
		else
		{
			global.opponent_1_accuracy = jsonData.a_1_accuracy;
		}
	}
	
	if(variable_struct_exists(jsonData, "a_2_accuracy"))
	{
		if(global.player_id == "a")
		{
			global.player_2_accuracy = jsonData.a_2_accuracy;
		}
		else
		{
			global.opponent_2_accuracy = jsonData.a_2_accuracy;
		}
	}
	
	if(variable_struct_exists(jsonData, "a_3_accuracy"))
	{
		if(global.player_id == "a")
		{
			global.player_3_accuracy = jsonData.a_3_accuracy;
		}
		else
		{
			global.opponent_3_accuracy = jsonData.a_3_accuracy;
		}
	}
	
	if(variable_struct_exists(jsonData, "b_1_accuracy"))
	{
		if(global.player_id == "b")
		{
			global.player_1_accuracy = jsonData.b_1_accuracy;
		}
		else
		{
			global.opponent_1_accuracy = jsonData.b_1_accuracy;
		}
	}
	
	if(variable_struct_exists(jsonData, "b_2_accuracy"))
	{
		if(global.player_id == "b")
		{
			global.player_2_accuracy = jsonData.b_2_accuracy;
		}
		else
		{
			global.opponent_2_accuracy = jsonData.b_2_accuracy;
		}
	}
	
	if(variable_struct_exists(jsonData, "b_3_accuracy"))
	{
		if(global.player_id == "b")
		{
			global.player_3_accuracy = jsonData.b_3_accuracy;
		}
		else
		{
			global.opponent_3_accuracy = jsonData.b_3_accuracy;
		}
	}
	
	if(variable_struct_exists(jsonData, "readya"))
	{
		if(global.player_id == "a")
		{
			global.player_ready = jsonData.readya;
		}
		else
		{
			global.opponent_ready = jsonData.readya;
		}
	}
	
	if(variable_struct_exists(jsonData, "readyb"))
	{
		if(global.player_id == "b")
		{
			global.player_ready = jsonData.readyb;
		}
		else
		{
			global.opponent_ready = jsonData.readyb;
		}
	}
}