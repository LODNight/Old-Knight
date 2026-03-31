/// @function enemy_draw_hp_bar()
/// @description Vẽ thanh máu bo góc phía trên đầu kẻ địch
function enemy_draw_hp_bar() {
    if (hp < hp_max) {
        var bar_width = 40;  
        var bar_height = 6;    // Tui tăng chiều cao lên 1 tí (6 thay vì 5) để góc bo nhìn rõ nét hơn
        var bar_y_offset = 30; 
        
        // Độ bo góc (bạn có thể thay đổi số này, số càng lớn góc càng tròn)
        var radius = 6; 
        
        var x1 = x - (bar_width / 2);
        var y1 = y - bar_y_offset;
        var x2 = x + (bar_width / 2);
        var y2 = y1 + bar_height;
        
        var hp_percent = hp / hp_max;
        
        // 1. Vẽ nền đen (máu đã mất) - Có bo góc
        draw_set_color(c_black);
        draw_roundrect_ext(x1, y1, x2, y2, radius, radius, false); 
        
        // 2. Vẽ phần máu xanh lá còn lại - Có bo góc
        if (hp > 0) {
            draw_set_color(c_lime);
            var current_width = (x2 - x1) * hp_percent; 
            draw_roundrect_ext(x1, y1, x1 + current_width, y2, radius, radius, false);
        }
        
        // 3. Vẽ viền trắng bọc bên ngoài - Có bo góc
        draw_set_color(c_white);
        // Tui cộng thêm 1 vào radius của viền để nó ôm sát mượt mà với phần lõi bên trong
        draw_roundrect_ext(x1 - 1, y1 - 1, x2 + 1, y2 + 1, radius + 1, radius + 1, true); 
        
        // Reset lại màu mặc định
        draw_set_color(c_white);
    }
}