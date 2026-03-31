
// Inherit the parent event
event_inherited();

// ===== STATS =====

// override sprite cho slime
spr_walk[0] = spr_slime1_walk_right;
spr_walk[1] = spr_slime1_walk_down;
spr_walk[2] = spr_slime1_walk_left;
spr_walk[3] = spr_slime1_walk_up;

spr_hit[0] = spr_slime1_hit_right;
spr_hit[1] = spr_slime1_hit_down;
spr_hit[2] = spr_slime1_hit_left;
spr_hit[3] = spr_slime1_hit_up;

spr_attack[0] = spr_slime1_attack_right;
spr_attack[1] = spr_slime1_attack_down;
spr_attack[2] = spr_slime1_attack_left;
spr_attack[3] = spr_slime1_attack_up;