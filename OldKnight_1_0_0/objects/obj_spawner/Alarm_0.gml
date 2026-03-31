//sp_point = irandom_range(1,4)

//switch (sp_point){
//	case 1:	instance_create_layer(obj_startSpawn.x, obj_startSpawn.x , "Instances_1",obj_slime_1)
//}

instance_create_layer(obj_startSpawn.x, obj_startSpawn.y , "Spawn_Enemy",obj_slime_1)

begin_time_ran =  3
end_time_ran = 6
alarm[0] = random_range(begin_time_ran * fps, end_time_ran * fps)