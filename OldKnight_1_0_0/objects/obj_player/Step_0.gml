// 1. Xoay nhân vật theo chuột
direction = point_direction(x, y, mouse_x, mouse_y);
image_angle = direction;

// 2. Giảm thời gian chớp đỏ
if (flash_timer > 0) {
    flash_timer--;
}

// KHỞI TẠO BIẾN TỐC ĐỘ CHO FRAME NÀY
var _hspd = 0;
var _vspd = 0;

// 3. KIỂM TRA TRẠNG THÁI (CHOÁNG HAY BÌNH THƯỜNG)
if (stun_timer > 0) {
    // --- TRẠNG THÁI BỊ CHOÁNG & VĂNG LÙI ---
    stun_timer--;
    
    // Tính toán tốc độ văng lùi
    _hspd = lengthdir_x(knockback_spd, knockback_dir);
    _vspd = lengthdir_y(knockback_spd, knockback_dir);
    
    // Giảm dần lực văng (Ma sát)
    knockback_spd = lerp(knockback_spd, 0, 0.1);
    
} else {
    // --- TRẠNG THÁI BÌNH THƯỜNG (Điều khiển WASD) ---
    var _top = keyboard_check(ord("W"));
    var _right = keyboard_check(ord("D"));
    var _down = keyboard_check(ord("S"));
    var _left = keyboard_check(ord("A"));

    var _hinput = (_right - _left);
    var _vinput = (_down - _top);
    
    // Nếu có bấm phím di chuyển
    if (_hinput != 0 || _vinput != 0) {
        var _move_dir = point_direction(0, 0, _hinput, _vinput);
        _hspd = lengthdir_x(spd, _move_dir); 
        _vspd = lengthdir_y(spd, _move_dir);
    }
}

// 4. HỆ THỐNG VA CHẠM CHUNG (Áp dụng cho cả đi bộ và văng lùi)

// Va chạm ngang (Horizontal)
if (place_meeting(x + _hspd, y, obj_solid)) {
    while (!place_meeting(x + sign(_hspd), y, obj_solid)) {
        x += sign(_hspd);
    }
    _hspd = 0; 
}
x += _hspd; // Áp dụng di chuyển ngang

// Va chạm dọc (Vertical)
if (place_meeting(x, y + _vspd, obj_solid)) {
    while (!place_meeting(x, y + sign(_vspd), obj_solid)) {
        y += sign(_vspd);
    }
    _vspd = 0; 
}
y += _vspd; // Áp dụng di chuyển dọc


depth = -bbox_bottom;