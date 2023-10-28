gravity_direction = 270
maxHypeMeter = 2500
currentHypeMeter = maxHypeMeter / 2

hSpeed = 0
vSpeed = 0

hSpeedCarry = 0
hSpeedSlowdown = 0.05

grav = .25

tongueX = x
tongueY = y




enum States {
	regular,
	grappling
}

enum TongueStates {
	tongue_out,
	tongue_in
}


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
	if((currentHypeMeter + obj_enemy.hypeMeterValue) > maxHypeMeter)
	{
		currentHypeMeter = maxHypeMeter
	} else {
		currentHypeMeter += obj_enemy.hypeMeterValue
	}
	
}