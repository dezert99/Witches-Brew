
if keyboard_check_pressed(vk_up) {
	y -= spd;
}

if keyboard_check_pressed(vk_down) {
	y += spd;
}

if keyboard_check_pressed(vk_right){
	x += spd;
}

if keyboard_check_pressed(vk_left){
	x -= spd;
}

if collision_circle(x,y,10,obj_monster,false,true){
	instance_destroy(obj_player_Saul)
}