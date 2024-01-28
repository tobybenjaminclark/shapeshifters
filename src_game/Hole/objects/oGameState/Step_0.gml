/// @description Insert description here
// You can write your code in this editor

switch(state)
{
	case 0: // Not started yet
		if(!state_0_announcement_shown)
		{
			global.announcement = "Gamers Rise Up! Do your best T-Pose.";
			state_0_announcement_shown = true;
			start_time = current_time;
			room_goto(rmAnnouncement);	
		}
		else if(state_0_announcement_shown)
		{
			// Has enough time passed?
			var elapsedTime = current_time - start_time;
			draw_text(x, y, elapsedTime);
			if(elapsedTime >= 2000)
			{
				room_goto(rmMatchPose);
				start_time = current_time;
				state = 1;
			}
		}
		break;
		
	case 1: // T Pose Match
		var elapsedTime = current_time - start_time;
		draw_text(x, y, elapsedTime);
		if(elapsedTime >= 10000)
		{
			if(!state_1_announcement_shown)
			{
				global.announcement = "It's 2017, Hit a dab!";
				state_1_announcement_shown = true;
				start_time2 = current_time;
				room_goto(rmAnnouncement);	
			}
			else if(state_1_announcement_shown)
			{
				// Has enough time passed?
				var elapsedTime = current_time - start_time2;
				draw_text(x, y, elapsedTime);
				if(elapsedTime >= 4000)
				{
					room_goto(rmMatchPose);
					start_time = current_time;
					state = 2;
				}
			}
		}
		break;
	case 2: // Dab Match
		var elapsedTime = current_time - start_time;
		draw_text(x, y, elapsedTime);
		if(elapsedTime >= 10000)
		{
			if(!state_2_announcement_shown)
			{
				global.announcement = "Show me your best Kung Fu Kick!";
				state_2_announcement_shown = true;
				start_time2 = current_time;
				room_goto(rmAnnouncement);	
			}
			else if(state_2_announcement_shown)
			{
				// Has enough time passed?
				var elapsedTime = current_time - start_time2;
				draw_text(x, y, elapsedTime);
				if(elapsedTime >= 4000)
				{
					room_goto(rmMatchPose);
					start_time = current_time;
					state = 3;
				}
			}
		}
		break;
	case 3: // Ninja Match
		var elapsedTime = current_time - start_time;
		draw_text(x, y, elapsedTime);
		if(elapsedTime >= 10000)
		{
			if(!state_3_announcement_shown)
			{
				global.announcement = "Challenge your opponent, pull a pose\n they have to replicate";
				state_3_announcement_shown = true;
				start_time2 = current_time;
				room_goto(rmAnnouncement);	
			}
			else if(state_3_announcement_shown)
			{
				// Has enough time passed?
				var elapsedTime = current_time - start_time2;
				draw_text(x, y, elapsedTime);
				if(elapsedTime >= 4000)
				{
					room_goto(rmMatchPose);
					start_time = current_time;
					state = 4;
				}
			}
		}
		break;
	case 4: // Pulling Pose 4 opponent
		var elapsedTime = current_time - start_time;
		draw_text(x, y, elapsedTime);
		if(elapsedTime >= 10000)
		{
			if(!state_4_announcement_shown)
			{
				global.announcement = "Your opponent wants you to\n replicate this";
				state_4_announcement_shown = true;
				start_time2 = current_time;
				room_goto(rmAnnouncement);	
			}
			else if(state_4_announcement_shown)
			{
				// Has enough time passed?
				var elapsedTime = current_time - start_time2;
				draw_text(x, y, elapsedTime);
				if(elapsedTime >= 4000)
				{
					room_goto(rmMatchPose);
					start_time = current_time;
					state = 5;
				}
			}
		}
		break;
	case 5: // Pulling Pose 4 opponent
		var elapsedTime = current_time - start_time;
		draw_text(x, y, elapsedTime);
		if(elapsedTime >= 10000)
		{
			if(!state_4_announcement_shown)
			{
				global.announcement = "Lets see if you shifted your shapes!";
				state_4_announcement_shown = true;
				start_time2 = current_time;
				room_goto(rmAnnouncement);	
			}
			else if(state_4_announcement_shown)
			{
				// Has enough time passed?
				var elapsedTime = current_time - start_time2;
				draw_text(x, y, elapsedTime);
				if(elapsedTime >= 4000)
				{
					room_goto(rmWinner);
					start_time = current_time;
					state = 0;
					instance_destroy(self);
				}
			}
		}
		break;
}








