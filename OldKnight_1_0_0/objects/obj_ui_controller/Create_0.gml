panel_width = 180;
panel_height = 400;

panel_margin = 20;

// vị trí panel (bên phải màn hình)
panel_x = display_get_gui_width() - panel_width - panel_margin;
panel_y = panel_margin;

// button
btn_width = panel_width - 20;
btn_height = 40;
btn_margin = 10;

// danh sách button
buttons = [
    {name: "Slime", obj: obj_slime_1}
];