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
			global.queued_room = rmAnnouncement;	
		}
		else if(state_0_announcement_shown)
		{
			// Has enough time passed?
			var elapsedTime = current_time - start_time;
			draw_text(x, y, elapsedTime);
			if(elapsedTime >= 2000)
			{
				global.queued_room = rmMatchPose;
				start_time = current_time;
				state = 1;
			}
		}
		break;
		
	case 1: // T Pose Match
		var elapsedTime = current_time - start_time;
		draw_text(x, y, elapsedTime);
		// Calculate current accuracy
		var player_1_accuracy = calc_accuracy(global.PlayerPose, global.TPOSE, 5);
		if(player_1_accuracy > state_1_max_accuracy) state_1_max_accuracy = player_1_accuracy;
		
		/* SETTING ACCURACY FOR 1 */
		global.b_1_accuracy = player_1_accuracy;
			
		
		if(elapsedTime >= 10000)
		{
			if(!state_1_announcement_shown)
			{
				global.announcement = "You got an accuracy of " + string(state_1_max_accuracy) + "\nIt's 2017, Hit a dab!";
				
				// Award Points
				global.player_points1 = round(state_1_max_accuracy / 10);
				
				state_1_announcement_shown = true;
				start_time2 = current_time;
				global.queued_room = rmAnnouncement;
			}
			else if(state_1_announcement_shown)
			{
				// Has enough time passed?
				var elapsedTime = current_time - start_time2;
				var op_accuracy = global.a_1_accuracy; // <-- Global A2 Accuracy
				draw_text(x, y, elapsedTime);
				if(elapsedTime >= 4000
				&& op_accuracy != -1)
				{
					global.opponent_score1 = round(opp_accuracy / 10);
					global.queued_room = rmMatchPose;
					start_time = current_time;
					state = 2;
				}
			}
		}
		break;
	case 2: // Dab Match
	
		var player_2_accuracy = calc_accuracy(global.PlayerPose, global.DAB, 5);
		if(player_2_accuracy > state_2_max_accuracy) state_2_max_accuracy = player_2_accuracy;
		
		/* Accuracy AGAIN! */
		global.b_2_accuracy = player_2_accuracy;
		
		var elapsedTime = current_time - start_time;
		draw_text(x, y, elapsedTime);
		if(elapsedTime >= 10000)
		{
			if(!state_2_announcement_shown)
			{
				global.player_points2 = round(state_2_max_accuracy / 10);
				global.announcement = "You scored an accuracy of " + string(state_2_max_accuracy) + "\nShow me your best Kung Fu Kick!";
				state_2_announcement_shown = true;
				start_time2 = current_time;
				global.queued_room = rmAnnouncement;
			}
			else if(state_2_announcement_shown)
			{
				// Has enough time passed?
				var elapsedTime = current_time - start_time2;
				var op_accuracy = global.a_2_accuracy; // <-- Global A2 Accuracy
				draw_text(x, y, elapsedTime);
				if(elapsedTime >= 4000
				&& op_accuracy != -1) // <-- A2 ACCURACY
				{
					global.opponent_score2 = round(opp_accuracy / 10);
					global.queued_room = rmMatchPose;
					start_time = current_time;
					state = 3;
				}
			}
		}
		break;
	case 3: // Ninja Match
	
		var player_3_accuracy = calc_accuracy(global.PlayerPose, global.NINJA, 5);
		if(player_3_accuracy > state_3_max_accuracy) state_3_max_accuracy = player_3_accuracy;
	
		/* Accuracy AGAIN AGAIN! */
		global.b_3_accuracy = player_3_accuracy;
	
		var elapsedTime = current_time - start_time;
		draw_text(x, y, elapsedTime);
		if(elapsedTime >= 10000)
		{
			if(!state_3_announcement_shown)
			{
				
				global.announcement = "You scored an accuracy of " + string(state_3_max_accuracy) + "\nChallenge your opponent, pull a pose\n they have to replicate";
				state_3_announcement_shown = true;
				start_time2 = current_time;
				global.queued_room = rmAnnouncement;	
			}
			else if(state_3_announcement_shown)
			{
				// Has enough time passed?
				var elapsedTime = current_time - start_time2;
				var op_accuracy = global.a_3_accuracy; // <-- Global A3 Accuracy
				draw_text(x, y, elapsedTime);
				if(elapsedTime >= 4000
				&& op_accuracy != -1) 
				{
					global.player_points3 = round(state_3_max_accuracy / 10);
					global.opponent_score3 = round(opp_accuracy / 10);
					
					global.queued_room = rmMatchPose;
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
				global.queued_room = rmAnnouncement;	
			}
			else if(state_4_announcement_shown)
			{
				// Has enough time passed?
				var elapsedTime = current_time - start_time2;
				draw_text(x, y, elapsedTime);
				if(elapsedTime >= 4000)
				{
					global.queued_room = rmMatchPose;
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
				global.queued_room = rmAnnouncement;
			}
			else if(state_4_announcement_shown)
			{
				// Has enough time passed?
				var elapsedTime = current_time - start_time2;
				draw_text(x, y, elapsedTime);
				if(elapsedTime >= 4000)
				{
					global.queued_room = rmWinner;
					start_time = current_time;
					state = 0;
					instance_destroy(self);
				}
			}
		}
		break;
}