
if (flash_timer > 0) {

    var dark_red = make_color_rgb(150, 20, 20); 

    // Bật sương mù với màu vừa pha
    gpu_set_fog(true, dark_red, 0, 0); 
    
    // Vẽ nhân vật
    draw_self();
    
    // Tắt sương mù đi
    gpu_set_fog(false, dark_red, 0, 0); 
} 
else {
    draw_self();
}