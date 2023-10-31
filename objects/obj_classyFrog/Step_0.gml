grounded = (instance_place(x, y + 1, obj_block))

var _keyLeft = keyboard_check(ord("A"))
var _keyRight = keyboard_check(ord("D"))
var _keyUp = keyboard_check_pressed(ord("W"))


if y < 0 then
{
	y =room_height - 100
	x += 550
}
// subtracts 1 from the hype meter every step and calculates the current jump height
// if the hype meter is less than or equal to 1, lose the game
// minimum jump height of 7, maximum jump height of 11
if(currentHypeMeter > 1)
{
	currentHypeMeter -= 1
	currentJumpHeight = int64(currentHypeMeter / 150)
	currentJumpHeight = clamp(currentJumpHeight,7,11)
} else {
	global.gameOver = true
	audio_play_sound(snd_lose, 1, false)
	room_goto(rm_lose)
}

switch(state)
{
	case States.regular: 
	{
		
		
		//sets the default sprite
		if grounded
		{
			sprite_index = spr_classyFrog
		}
		
		// checks which key is pressed and which direction to move and 
		// accelerates by move speed  
		var dir = _keyRight - _keyLeft
		hSpeed += dir * move_speed
		if(dir == 0)
		{
			hSpeed = 0	
		}
		
		// knockback calculations
		hSpeed = clamp(hSpeed, -move_speed, move_speed)
		hSpeedCarry = lerp(hSpeedCarry, 0, hSpeedSlowdown)
		hSpeed = lerp(hSpeed, 0, hSpeedSlowdown)
		hSpeed = hSpeed + hSpeedCarry
		
		vSpeed += grav
		
		// checks for up input and if the player is grounded
		// changes sprite for hopping 
		// adds hop audio
		if((_keyUp) && (grounded))
		{
			vSpeed = -clamp(currentJumpHeight,7,11)
			grounded = false
			audio_play_sound(snd_jump,0,false)
				sprite_index = spr_classyFrogHop			
		}
		
		// checks if left mouse button is pressed, then calculates the direction and distance
		// of the mouse click relative to the character position, then changes states to grappling
		if(mouse_check_button_pressed(mb_left)) 
		{
			tongueX = x
			tongueY = y
			grappleX = mouse_x
			grappleY = mouse_y
			
			tongueAngleVelocity = 0
			tongueAngle = point_direction(grappleX, grappleY, x, y)
			tongueLength = point_distance(grappleX, grappleY, x, y)
			
			// if there is a block at the mouse position, start grappling
			if(instance_position(mouse_x, mouse_y, obj_block))
			{		
				state = States.grappling
				audio_play_sound(snd_grapple,0,false)
			}
			
			// checks if the enemy is able to be eaten, then updates the sprite
			// and adds its hype meter value to the hype meter
			if(canEatEnemy())
			{
				eatEnemy()
				tongue_state = TongueStates.tongue_out
				sprite_index = spr_classyFrogOpenMouth
				alarm[0] = 15
				audio_play_sound(snd_eatEnemy,0,false)
			}
		}

		 break;
	}
	

	case States.grappling:
	{
		//set the default grappling sprite
		if grounded 
		{
			sprite_index = spr_classyFrogOpenMouth
		}
		//set the jumping grappling sprite
		if !grounded 
		{
			sprite_index = spr_classyFrogOpenMouthHop
		}
		
		// acceleration of the player when grappling based on their angle
		var _tongueAngleAcceleration = -0.2 * dcos(tongueAngle)
		
		tongueAngleVelocity += _tongueAngleAcceleration
		tongueAngle += tongueAngleVelocity
		tongueAngleVelocity *= 0.99
			
		tongueX = grappleX + lengthdir_x(tongueLength, tongueAngle)
		tongueY = grappleY + lengthdir_y(tongueLength, tongueAngle)
		
		hSpeed = tongueX - x
		vSpeed = tongueY - y
		
		// hold left or right to swing while grappled
		if(_keyLeft) 
		{
			tongueAngleVelocity -= .0325
		}
	
		if(_keyRight) 
		{
			tongueAngleVelocity += .0325
		}
		
		// input up to end the grapple
		if(_keyUp)
		{
			vSpeed -= currentJumpHeight / 2
			state = States.regular
		}
	} break;
	
}

// horizontal collision checking
if(instance_place(x + hSpeed, y, obj_block))
{
	while(!instance_place(x + sign(hSpeed), y, obj_block)) 
	{
		x += sign(hSpeed)
	}
	
	hSpeed = 0
	
	if(state == States.grappling)
	{
		tongueAngle = point_direction(grappleX, grappleY, x, y)
		tongueAngleVelocity = 0
	}
}
x += hSpeed

// vertical collision checking
if(instance_place(x, y + vSpeed, obj_block))
{
	while(!instance_place(x, y + sign(vSpeed), obj_block)) 
	{
		y += sign(vSpeed)		
	}
	
	vSpeed = 0
	
	if(state == States.grappling)
	{
		tongueAngle = point_direction(grappleX, grappleY, x, y)
		tongueAngleVelocity = 0
	}
}
y += vSpeed

ifhit = false
