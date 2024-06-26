
#macro SCALING_FACTOR 0.5

global.sending_data = false;

global.data_map = ds_map_create();


global.player_id = "b";
global.opponent_id = "a";
global.game_id = -1;

global.jsonData = {};
global.jsonData.readyb = "false";
global.jsonData.readya = "false";
global.jsonData.a_1_accuracy = -1;
global.jsonData.a_2_accuracy = -1;
global.jsonData.a_3_accuracy = -1;

global.jsonData.b_1_accuracy = -1;
global.jsonData.b_2_accuracy = -1;
global.jsonData.b_3_accuracy = -1;

global.queued_room = -1;

global.player_points = 0;

/* Default Poses */
global.DAB =
{rk2rf: 267.62, lk2lf: 269.85, s2h: 111.96, s2le: 179.54, s2re: 11.55, s2w: 277.98, h2lk: 269.85, h2rk : 265.29, re2rw: 15.52, le2lw: 34.65 };

global.NINJA = 
{lk2lf: 279.64, rk2rf: 22.73, h2lk: 279.64, h2rk: 22.73, s2le: 206.54, s2re:
20.74, le2lw: 48.17, re2rw: 32.94, s2h: 94.42, s2w: 287.08};

/* Default Poses */
global.TPOSE =
{
	s2h: 90,
	s2w: 270.08,
	s2re: 0,
	re2rw: 0,
	s2le: 180,
	le2lw: 180,
	h2rk: 360 - 60,
	rk2rf: 360 - 60,
	h2lk: 360 - 120,
	lk2lf: 360 - 120
};

global.highlight_pose = global.TPOSE;

/* Player & Other Player Poses */
global.PlayerPose =
{
	s2h: 90,
	s2w: 270.08,
	s2re: 0,
	re2rw: 0,
	s2le: 180,
	le2lw: 180,
	h2rk: 360 - 60,
	rk2rf: 360 - 60,
	h2lk: 360 - 120,
	lk2lf: 360 - 120
}

global.OtherPlayerPose =
{
	s2h: 90,
	s2re: 0,
	re2rw: 270,
	s2w: 287.08,
	s2le: 180,
	le2lw: 180,
	h2rk: 360 - 60,
	rk2rf: 360 - 60,
	h2lk: 360 - 120,
	lk2lf: 360 - 120
};