gravity_direction = 270
maxHypeMeter = 2500
currentHypeMeter = maxHypeMeter / 2

hSpeed = 0
vSpeed = 0

hSpeedCarry = 0
hSpeedSlowdown = 0.075

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

// checks to see if the mouse position is over an enemy object 
// and if there are no blocks between the player and the enemy
function canEatEnemy(){
	if(instance_position(mouse_x, mouse_y, obj_enemy) && collision_line(x, y, mouse_x, mouse_y, obj_block, false, false) == noone)
	{
		return true;
	}
}

// adds the hype meter value of the enemy that is eaten to the hype meter
function eatEnemy()
{
	if((currentHypeMeter + obj_enemy.hypeMeterValue) > maxHypeMeter)
	{
		currentHypeMeter = maxHypeMeter
	} else {
		currentHypeMeter += obj_enemy.hypeMeterValue
	}
	
}