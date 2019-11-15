#region Get player controls
if(has_control) {
	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));

	key_jump = keyboard_check(ord("W"));

	if(key_left || key_right || key_jump) {
		controller = 0;
	}

	if(abs(gamepad_axis_value(0, gp_axislh)) > 0.2) {
		key_left = abs(min(gamepad_axis_value(0, gp_axislh), 0));
		key_right = max(gamepad_axis_value(0, gp_axislh), 0);
		controller = 1;
	}	

	if(gamepad_button_check_pressed(0, gp_shoulderlb)) {
		key_jump = 1;
		controller = 1;
	}
} else {
	key_left = 0;
	key_right = 0;
	key_jump = 0;
}
#endregion

#region Calculate Movement
var move = key_right - key_left;
hsp = move * walksp;
vsp = vsp + grv;

if (place_meeting(x, y + 1, obj_wall) && key_jump) {
	vsp = -5;
}
#endregion

#region Horizontal Collision
if (place_meeting(x + hsp, y, obj_wall)) {
	while (!place_meeting(x + sign(hsp), y, obj_wall)) {
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;
#endregion

#region Vertical Collision
if (place_meeting(x, y + vsp, obj_wall)) {
	while (!place_meeting(x, y + sign(vsp),  obj_wall)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;
#endregion

#region Animation
if (!place_meeting(x, y + 1, obj_wall)) {
	sprite_index = spr_player_boy_jumping;
	image_speed = 0;
	if (vsp > 0) image_index = 1; else image_index = 0;
}
else {
	image_speed = 1;
	if (hsp == 0) {
		sprite_index = spr_player_boy;
	}
	else {
		sprite_index  = spr_player_boy_running;
		show_debug_message(image_index);
	}
}

if (hsp != 0) image_xscale = sign(hsp);
#endregion
