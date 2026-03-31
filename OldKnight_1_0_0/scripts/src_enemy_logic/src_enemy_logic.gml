/// @function enemy_update_target():
/// @description Tìm và lấy hướng về phía người chơi
function enemy_update_target() {
    if (instance_exists(obj_player)) {
        var target = obj_player;
        direction = point_direction(x, y, target.x, target.y);
    }
}

/// @function enemy_handle_states():
/// @description Xử lý hành vi theo từng trạng thái
function enemy_handle_states() {
    switch (state) {
        case ENEMY_STATE.HIT:
			// 1. Tính toán tọa độ bị đẩy lùi
		    var kx = lengthdir_x(knockback_spd, knockback_dir);
			var ky = lengthdir_y(knockback_spd, knockback_dir);
			
			// Áp dụng di chuyển
		    x += kx;
		    y += ky;
			
			// 2. Giảm dần lực đẩy (Tạo cảm giác ma sát)
			// lerp: giảm mượt mà tốc độ về 0 (0.1 là độ trơn, số càng lớn dừng càng gấp)
			knockback_spd = lerp(knockback_spd, 0, 0.3);
	
            hit_timer--;
            if (hit_timer <= 0) {
                state = ENEMY_STATE.WALK;
            }
            break;

        case ENEMY_STATE.WALK:
            if (instance_exists(obj_player)) {
		        // Khoảng cách giữa quái và người
		        var dist = point_distance(x, y, obj_player.x, obj_player.y);
        
		       // Nếu vào đủ gần VÀ đã hồi chiêu xong -> Chuyển sang cắn
		       if (dist <= attack_range && attack_timer <= 0) {
		            state = ENEMY_STATE.ATTACK;
		            image_index = 0;          // Ép nó chạy animation nổ từ frame đầu tiên
		            has_dealt_damage = false; // Reset lại trạng thái sát thương
		        } else {
		            // Nếu chưa tới gần thì cứ đi bộ bình thường
		            var dx = lengthdir_x(move_spd, direction);
		            var dy = lengthdir_y(move_spd, direction);
		            x += dx;
		            y += dy;
		        }
		    }
    
		    // Giảm thời gian chờ hồi chiêu
		    if (attack_timer > 0) {
		        attack_timer--;
		    }
            break;
			
        case ENEMY_STATE.ATTACK:
	        // 1. Canh đúng frame nổ gai (Ví dụ frame số 5) để gây sát thương
	        var damage_frame = 5; 
        
	        if (image_index >= damage_frame && !has_dealt_damage) {
	            if (instance_exists(obj_player)) {
	                // Tính khoảng cách nổ (Bán kính nổ có thể to hơn tầm gồng một chút)
	                var hit_dist = point_distance(x, y, obj_player.x, obj_player.y);
	                var explosion_radius = explosion_range; 
                
	                if (hit_dist <= explosion_radius) {
	                    obj_player.hp -= damage;
	                    // Tùy chọn: Thêm obj_damage_text hiện lên đầu archer ở đây
						if (hit_dist <= explosion_radius) {
				            // Trừ máu người chơi
				            obj_player.hp -= damage;
            
				            // Kích hoạt chớp đỏ trong vòng 15 frames (khoảng 0.25 giây)
				            obj_player.flash_timer = 15; 
				        }
	                }
	            }
	            // Khóa lại để các frame 6, 7, 8... không trừ máu liên tục nữa
	            has_dealt_damage = true; 
	        }

	        // 2. Chờ Animation chạy xong thì quay lại đi bộ
	        // (image_number là tổng số frame của sprite)
	        if (image_index >= image_number - 1) {
	            state = ENEMY_STATE.WALK;
	            attack_timer = attack_cooldown; // Bắt đầu tính giờ nghỉ
	        }
	    break;
		
        case ENEMY_STATE.DEAD:
            instance_destroy();
            break;
    }
}

/// @function enemy_update_sprite():
/// @description Đổi sprite dựa trên hướng và trạng thái
function enemy_update_sprite() {
    // Xác định hướng 4 chiều (0: Phải, 1: Dưới, 2: Trái, 3: Trên)
    var dir4 = round(direction / 90) mod 4;
    dir4 = (4 - dir4) mod 4;

    var spr_array;

    // Chọn mảng sprite theo trạng thái
    if (state == ENEMY_STATE.HIT) {
        spr_array = spr_hit;
    } else if (state == ENEMY_STATE.ATTACK) {
		spr_array = spr_attack;	
	} else {
        spr_array = spr_walk;
    }

    // Lấy sprite thực tế từ mảng
    var new_sprite = spr_array[dir4];

    // Chỉ đổi khi cần để animation không bị reset liên tục
    if (sprite_index != new_sprite && new_sprite != noone) {
        sprite_index = new_sprite;
        image_index = 0;
    }
}