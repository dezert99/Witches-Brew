while(!is_placed){
	var spawn_x = random_range(0,room_width);
	var spawn_y = random_range(0,room_height);
	
	if(!instance_position(spawn_x,spawn_y, obj_nospawn)){
		x = spawn_x;
		y = spawn_y;
		is_placed = true;
	}
}

if(collision_rectangle(x,y,x+32*scale,y+32*scale,obj_player,true,false) && keyboard_check_pressed(ord("E"))){
	addToInventory(item_id, quantity);	
	instance_destroy();
}