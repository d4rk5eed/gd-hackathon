/// @description GUI/Vars/Menu setup

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

menu_x = gui_width + 200;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_speed = 25; //lower is faster
menu_font = fon_menu;
menu_itemheight = font_get_size(fon_menu);
menu_commited = -1;
menu_control = true;

menu = array_create(0);
menu[0] = "Quit";
menu[1] = "Продолжить";
menu[2] = "Новая игра";

menu_cursor = 2;

menu_items = array_length_1d(menu);
