// Bấm ESC để thoát game
if (keyboard_check_pressed(vk_escape)) {
    game_end();
}


// 1. Cập nhật tọa độ mục tiêu (Theo sát Player)
if (instance_exists(follow)) {
    xTo = follow.x;
    yTo = follow.y;
}

// 2. Di chuyển mượt mà (Lerp)
// Số 10 là độ trễ. Số càng lớn thì camera lướt càng chậm và mượt.
x += (xTo - x) / 10;
y += (yTo - y) / 10;

// 3. Giới hạn không cho camera quay lọt ra ngoài rìa bản đồ đen thui
x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

// 4. Áp dụng tọa độ mới cho camera
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);