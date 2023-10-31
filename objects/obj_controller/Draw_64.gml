/// @description Insert description here
// You can write your code in this editor
jumpHeight = clamp(obj_classyFrog.currentJumpHeight,7,11)
draw_text(55, 55, "Hype Meter: " + string(obj_classyFrog.currentHypeMeter))
draw_text(55, 70, "Jump Height: " + (string(jumpHeight)))
draw_text(55, 85, "vSpeed: " + string(obj_classyFrog.vSpeed))


