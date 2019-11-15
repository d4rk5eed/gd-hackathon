with(obj_player) {
	if(has_control) {
		has_control = false;
		slide_transition(TRANS_MODE.GOTO, other.target);
	}
}
