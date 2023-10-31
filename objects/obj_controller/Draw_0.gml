/// @description Insert description here
// You can write your code in this editor

draw_sprite(spr_hypeMeterBG, 0, hypeMeterX, hypeMeterY)
draw_sprite_stretched(spr_hypeMeter, 0, hypeMeterX, hypeMeterY, (obj_classyFrog.currentHypeMeter/obj_classyFrog.maxHypeMeter) * hypeMeterWidth, hypeMeterHeight)
draw_sprite(spr_hypeMeterBorder, 0, hypeMeterX, hypeMeterY)
