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