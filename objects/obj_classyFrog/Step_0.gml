if (using_tongue) {
}
else {
	if (keyboard_check(vk_left) and !instance_place(x-move_speed, y, obj_block)) {
		x += -move_speed
	}

	if (keyboard_check(vk_right) and !instance_place(x+move_speed, y, obj_block)) {
		x += move_speed
	}
	if (keyboard_check(vk_up)) {
		if (instance_place(x, y+1, obj_block)) {
		vspeed = jump_height
		}
	}
	if (instance_place(x, y+1, obj_block)) {
		gravity = 0
	}
	else gravity = game_gravity
	if vspeed >= max_vspeed {
		vspeed = max_vspeed
	}
}