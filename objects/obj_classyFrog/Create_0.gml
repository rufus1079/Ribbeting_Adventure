gravity_direction = 270

hSpeed = 0
vSpeed = 0

grav = .25

tongueX = x
tongueY = y

enum States {
	regular,
	jumping,
	tongue_out,
	grappling
}

state = -1
state = States.regular
