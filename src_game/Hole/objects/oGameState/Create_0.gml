		/// @description Insert description here
// You can write your code in this editor

// State 0: Not Started Yet
// State 1: Match T Pose
// State 2: Match Dab
// State 3: Match Ninja
// State 4: Pull a pose
// State 5: Match Opponent Pose

// Opponent Points
global.opponent_score1 = 0;
global.opponent_score2 = 0;
global.opponent_score3 = 0;

// Player Points
global.player_points1 = 0;
global.player_points2 = 0;
global.player_points3 = 0;

state = 0;

state_0_announcement_shown = false;
state_1_announcement_shown = false;
state_2_announcement_shown = false;
state_3_announcement_shown = false;
state_4_announcement_shown = false;
state_5_announcement_shown = false;

state_1_max_accuracy = 0;
state_2_max_accuracy = 0;
state_3_max_accuracy = 0;

state_1_max_accuracy_opp = 0;
state_2_max_accuracy_opp = 0;
state_3_max_accuracy_opp = 0;