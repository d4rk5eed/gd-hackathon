/// @desc slide_transition(mode, targetroom)
/// @arg Mode sets trans mode b/ween next , restart, goto
/// @arg Target set target room

with(obj_transition) {
	mode = argument[0];
	if(argument_count > 1) target = argument[1];
}