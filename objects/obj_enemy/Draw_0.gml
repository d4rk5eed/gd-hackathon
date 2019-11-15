if(flash > 0) {
	shader_set(sh_white);
	draw_self();
	shader_reset();
	flash--;
} else draw_self();