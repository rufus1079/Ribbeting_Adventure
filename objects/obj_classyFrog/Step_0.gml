grounded = (instance_place(x, y + 1, obj_block))

var _keyLeft = keyboard_check(ord("A"))
var _keyRight = keyboard_check(ord("D"))
var _keyUp = keyboard_check_pressed(ord("W"))

switch(state)
{
	case States.regular: 
	{
		// checks which key is pressed and which direction to move and 
		// accelerates by move speed  
		var dir = _keyRight - _keyLeft
		hSpeed += dir * move_speed
		if(dir == 0)
		{
			hSpeed = 0	
		}
		
		// hSpeed is clamped by move_speed
		hSpeed = clamp(hSpeed, -move_speed, move_speed)
		
		vSpeed += grav
		
		// checks for up input and if the player is grounded
		if((_keyUp) && (grounded))
		{
			grounded = false
			vSpeed = jump_height
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
			}
		}

		 break;
	}
	

	case States.grappling:
	{
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
			vSpeed += jump_height / 4
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
