/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(ord("G"))) {
	room_restart()
}

if(keyboard_check_pressed(ord("H"))) {
	game_restart()
}

if(keyboard_check_pressed(ord("J"))) {
	obj_classyFrog.currentHypeMeter = 2500
}

if(keyboard_check_pressed(ord("K"))) {
	obj_classyFrog.currentHypeMeter = 1
}

