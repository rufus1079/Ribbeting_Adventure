/// @description Insert description here
// You can write your code in this editor

if (mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, id) && (collision_line(obj_classyFrog.x, obj_classyFrog.y, mouse_x, mouse_y, obj_block, false, false) == noone)) {
   alarm[0] = 15
}



