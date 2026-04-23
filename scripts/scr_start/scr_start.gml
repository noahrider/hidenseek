function scr_start() {
	randomize();
	global.debug = true;
	
	#macro MAX_PLAYERS 24
	
	#macro c_atgreen make_color_rgb(34, 200, 132) 
	#macro c_alred make_color_rgb(250, 54, 86)
	#macro c_select c_atgreen
	
	#macro DEFAULT_SHIRT_COLOR #000000
	
	global.action = 0;
	global.facing = 0;
	global.txr = 4;
	
	global.language = "en";
	global.time = 0;
	
	global.msgno = 0;
	for (var i = 0; i < 48; i++) {
		global.msg[i] = "%%";
	}
	
	#region Input
	enum KEY {
		CONFIRM,
		CANCEL,
		MENU,
		DOWN,
		RIGHT,
		UP,
		LEFT,
		COUNT,
	};
	
	for (var i = 0; i < KEY.COUNT; i++) {
		global.inputMapKB[i] = array_create(2, -1);
		global.inputMapGP[i] = -1;
		global.inputPressed[i] = false;
		global.inputHeld[i] = false;
	}
	global.inputMapKB[KEY.CONFIRM][0] = ord("Z");
	global.inputMapKB[KEY.CONFIRM][1] = vk_enter;
	global.inputMapKB[KEY.CANCEL][0] = ord("X");
	global.inputMapKB[KEY.CANCEL][1] = vk_shift;
	global.inputMapKB[KEY.MENU][0] = ord("C");
	global.inputMapKB[KEY.MENU][1] = vk_control;
	global.inputMapKB[KEY.UP][0] = vk_up;
	global.inputMapKB[KEY.UP][1] = ord("W");
	global.inputMapKB[KEY.DOWN][0] = vk_down;
	global.inputMapKB[KEY.DOWN][1] = ord("S");
	global.inputMapKB[KEY.LEFT][0] = vk_left;
	global.inputMapKB[KEY.LEFT][1] = ord("A");
	global.inputMapKB[KEY.RIGHT][0] = vk_right;
	global.inputMapKB[KEY.RIGHT][1] = ord("D");
	
	global.inputMapGP[KEY.CONFIRM] = gp_face1;
	global.inputMapGP[KEY.CANCEL] = gp_face2;
	global.inputMapGP[KEY.MENU] = gp_face3;
	global.inputMapGP[KEY.UP] = gp_padu;
	global.inputMapGP[KEY.DOWN] = gp_padd;
	global.inputMapGP[KEY.LEFT] = gp_padl;
	global.inputMapGP[KEY.RIGHT] = gp_padr;
	
	//gamepad
	global.gamepad = -1;
	#endregion Input
	
	global.colors = [
		#FF2020,
		#FF8020,
		#FFFF20,
		#00FF20,
		#0080FF,
		#FF20FF,
		#FF80FF,
	];
	
	global.clientID = -1;
	global.clname = "";
	
	global.svip = "127.0.0.1";
	global.svport = 8080;
	
	for (var i = 0; i < MAX_PLAYERS; i++) {
		global.player[i] = {
			connected: false,
			tagged: false,
			host: false,
			info: {
				name: "NONAME",
				color: DEFAULT_SHIRT_COLOR,
			},
			lastKnownPosition: {
				x: 0,
				y: 0,
				room: 0,
				facing: 0,
			},
		};
	}
	
	enum PacketID {
		Ping,
		JoinServer,
		NewConnection,
		Disconnection,
		Movement,
		Message,
		InfoChange,
		SettingsChange,
		HostChange,
		TagAttempt,
		CustomPlayerInfo,
		Event,
	};
	enum EventID {
		GameStart,
		NewTagger,
		MapShrink,
	};
	
	draw_set_font(fnt_main);
}