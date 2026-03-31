window_set_fullscreen(true);

// Lấy ID của camera đang bật (Viewport 0)
cam = view_camera[0];

// Bám theo ai? (Chính là Player)
follow = obj_player;

// Lấy 1/2 chiều rộng và chiều cao của camera để tính tâm điểm
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

// Tọa độ mục tiêu sẽ di chuyển tới
xTo = xstart;
yTo = ystart;