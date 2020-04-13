if(collision_rectangle(x,y,x+32,y+32,obj_player,true,false) && keyboard_check_pressed(ord("E"))){
	addToInventory(item_id, quantity);	
	instance_destroy();
}