// ===== PANEL OUTER =====
draw_set_color(c_black);
draw_rectangle(panel_x, panel_y, panel_x + panel_width, panel_y + panel_height, true);

// ===== PANEL INNER =====
draw_set_color(c_white);
draw_rectangle(panel_x + 5, panel_y + 5, panel_x + panel_width - 5, panel_y + panel_height - 5, true);

// ===== DRAW BUTTONS =====
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

for (var i = 0; i < array_length(buttons); i++) {

    var bx = panel_x + 10;
    var by = panel_y + 10 + i * (btn_height + btn_margin);
	
	draw_set_color(c_white);
    // button background
    draw_rectangle(bx, by, bx + btn_width, by + btn_height, true);

    // border
    draw_set_color(c_black);
    draw_rectangle(bx, by, bx + btn_width, by + btn_height, false);

    // text
	draw_set_color(c_white);
    draw_text(bx + 10, by + 12, buttons[i].name);
}