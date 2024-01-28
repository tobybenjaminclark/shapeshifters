/// @description Insert description here
// You can write your code in this editor

switch(state)
{
	case 0: // Not started yet
		if(!state_0_announcement_shown)
		{
			audio_stop_all();
			audio_play_sound(GameMusic, 1, true);
			global.highlight_pose = global.TPOSE;
			audio_play_sound(STARFISH, 1, false);
			global.announcement = "You're the best! Do\n a star!";
			state_0_announcement_shown = true;
			start_time = current_time;
			global.queued_room = rmAnnouncement;	
		}
		else if(state_0_announcement_shown)
		{
			// Has enough time passed?
			var elapsedTime = current_time - start_time;
			draw_text(x, y, elapsedTime);
			if(elapsedTime >= 6000)
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
		
		// Player & Opponent Accuracy
		var player_1_accuracy = calc_accuracy(global.PlayerPose, global.TPOSE, 5);
		if(player_1_accuracy > state_1_max_accuracy) state_1_max_accuracy = player_1_accuracy;
		
		var opp1 = calc_accuracy(global.OtherPlayerPose, global.TPOSE, 5);
		if(opp1 > state_1_max_accuracy_opp) state_1_max_accuracy_opp = opp1;
		
		
		/* SETTING ACCURACY FOR 1 */
			
		
		if(elapsedTime >= 10000)
		{
			if(!state_1_announcement_shown)
			{
				global.highlight_pose = global.DAB;
				global.announcement = "You got an accuracy of " + string(state_1_max_accuracy) + "\nReach up & do the Usain Bolt!";
				audio_play_sound(USAIN, 1, false);
				
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
				draw_text(x, y, elapsedTime);
				if(elapsedTime >= 4000)
				{
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
		
		global.jsonData.readya = false;
		global.jsonData.readyb = false;
		send_json_data();
		
		/* Accuracy AGAIN! */
		var opp2 = calc_accuracy(global.OtherPlayerPose, global.DAB, 5);
		if(opp2 > state_2_max_accuracy_opp) state_2_max_accuracy_opp = opp2;
		
		var elapsedTime = current_time - start_time;
		draw_text(x, y, elapsedTime);
		if(elapsedTime >= 10000)
		{
			if(!state_2_announcement_shown)
			{
				global.player_points2 = round(state_2_max_accuracy / 10);
				global.highlight_pose = global.NINJA;
				audio_play_sound(NINJAKICK, 1, false);
				global.announcement = "You scored an accuracy of " + string(state_2_max_accuracy) + "\nShow me your best Kung Fu Kick!";
				state_2_announcement_shown = true;
				start_time2 = current_time;
				global.queued_room = rmAnnouncement;
			}
			else if(state_2_announcement_shown)
			{
				// Has enough time passed?
				var elapsedTime = current_time - start_time2;
				draw_text(x, y, elapsedTime);
				if(elapsedTime >= 4000) // <-- A2 ACCURACY
				{
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
		var opp3 = calc_accuracy(global.OtherPlayerPose, global.DAB, 5);
		if(opp3 > state_3_max_accuracy_opp) state_3_max_accuracy_opp = opp3;
		
		var elapsedTime = current_time - start_time;
		draw_text(x, y, elapsedTime);
		if(elapsedTime >= 10000)
		{
			if(!state_3_announcement_shown)
			{
				global.announcement = "Who is going to win?";
				state_3_announcement_shown = true;
				start_time2 = current_time;
				global.queued_room = rmAnnouncement;	
			}
			else if(state_3_announcement_shown)
			{
				// Has enough time passed?
				var elapsedTime = current_time - start_time2;
				draw_text(x, y, elapsedTime);
				if(elapsedTime >= 4000)
				{
					
					start_time = current_time;
					
					var opp_score = state_3_max_accuracy_opp + state_2_max_accuracy_opp + state_1_max_accuracy_opp;
					var plyr_score = state_3_max_accuracy + state_2_max_accuracy + state_1_max_accuracy;
					
					if(opp_score > plyr_score)
					{
						audio_play_sound(Loser, 1, false);
						global.queued_room = rmLose;
						instance_destroy(self);
					}
					else
					{
						audio_stop_all()
						audio_play_sound(sndLobby, 1, true);
						audio_play_sound(Winner, 2, false);
						global.queued_room = rmWinner;
						instance_destroy(self);
					}
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
				global.announcement = "Who is going to win?";
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
					
					start_time = current_time;
					
					var opp_score = state_3_max_accuracy_opp + state_2_max_accuracy_opp + state_1_max_accuracy_opp;
					var plyr_score = state_3_max_accuracy + state_2_max_accuracy + state_1_max_accuracy;
					
					if(opp_score > plyr_score)
					{
						audio_stop_all();
						global.queued_room = rmLose;
					}
					else
					{
						audio_stop_all();
						audio_play_sound(GameMusic, 1, true);
						global.queued_room = rmWinner;
					}
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