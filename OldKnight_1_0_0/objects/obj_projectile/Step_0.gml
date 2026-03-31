var target = instance_place(x, y, obj_enemy);

if (target != noone) {
    target.hp -= damage;
	
	var text = instance_create_layer(target.x, target.y,"Instances_1", obj_damage_text)
	text.damage = damage
	
	// Phát âm thanh
	audio_play_sound(snd_hit,1,false)
	
	// Đổi state sang HIT
	target.state = ENEMY_STATE.HIT;
	target.hit_timer = 15;
	
	// Truyền Knockback
    target.knockback_dir = direction; 
    target.knockback_spd = 4;
	
	
	instance_destroy()
}