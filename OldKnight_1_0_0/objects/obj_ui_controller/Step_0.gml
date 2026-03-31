var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if (mouse_check_button_pressed(mb_left)) {

    for (var i = 0; i < array_length(buttons); i++) {

        var bx = panel_x + 10;
        var by = panel_y + 10 + i * (btn_height + btn_margin);

        if (mx >= bx && mx <= bx + btn_width &&
            my >= by && my <= by + btn_height) {

            instance_create_layer(
                obj_spawner.x + irandom_range(-50, 50),
                obj_spawner.y + irandom_range(-50, 50),
                "Instances_1",
                buttons[i].obj
            );
        }
    }
}