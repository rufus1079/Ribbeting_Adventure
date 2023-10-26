gravity_direction = 270

hSpeed = 0
vSpeed = 0

grav = .25

tongueX = x
tongueY = y


enum States {
	regular,
	grappling,
	hit_enemy
}

/*enum TongueStates {
	extending,
	grappling,
	hit_enemy,
	missed
	
}*/

state = -1
state = States.regular
