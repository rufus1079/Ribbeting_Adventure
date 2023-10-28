/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(ord("R"))) {
	room_restart()
}

if(keyboard_check_pressed(ord("G"))) {
	game_restart()
}

if(keyboard_check_pressed(ord("T"))) {
	obj_classyFrog.currentHypeMeter = 999
}

if(keyboard_check_pressed(ord("Y"))) {
	obj_classyFrog.currentHypeMeter = 1
}

if(keyboard_check_pressed(ord("F"))) {
	// TODO: teleport to finish
}

