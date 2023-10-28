gravity_direction = 270

hSpeed = 0
vSpeed = 0

grav = .25

tongueX = x
tongueY = y

maxHypeMeter = 1000
currentHypeMeter = maxHypeMeter



enum States {
	regular,
	grappling,
}

enum TongueStates {
	tongue_out,
	tongue_in
}

/*enum TongueStates {
	extending,
	grappling,
	hit_enemy,
	missed
	
}*/

state = -1
state = States.regular

tongue_state = TongueStates.tongue_in

function canEatEnemy(){
	if(instance_position(mouse_x, mouse_y, obj_enemy) && collision_line(x, y, mouse_x, mouse_y, obj_block, false, false) == noone)
	{
		return true;
	}
}


function eatEnemy()
{
	if((currentHypeMeter + 200) > maxHypeMeter)
	{
		currentHypeMeter = maxHypeMeter
	} else {
		currentHypeMeter += 200
	}
	
}