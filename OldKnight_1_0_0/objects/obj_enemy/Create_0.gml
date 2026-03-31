

// ===== BIẾN ĐỘNG (Dynamic Variables) =====
state = ENEMY_STATE.WALK; // Dùng Enum ở đây
hit_timer = 0;
attack_timer = 0;      
hp = hp_max;

knockback_spd = 0;
knockback_dir = 0;
      
has_dealt_damage = false;

// ===== ANIMATION =====
image_speed = 1;
image_index = 0;

spr_walk = [noone, noone, noone, noone]; 
spr_hit  = [noone, noone, noone, noone];
spr_attack  = [noone, noone, noone, noone];