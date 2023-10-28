/// @description Insert description here
// You can write your code in this editor
draw_self()

if(state == States.grappling)
{
	draw_line_width_color(grappleX, grappleY, tongueX, tongueY, 4, #e64c65, #e64c65)	
}

if(tongue_state = TongueStates.tongue_out)
{
	draw_line_width_color(grappleX, grappleY, x, y, 4, #e64c65, #e64c65)
}
