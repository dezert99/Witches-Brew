if(keyboard_check_pressed(ord("C"))){
	isVisible = !isVisible;	
}

if(!isVisible) exit;

#region MouseSlot woah this is really cool
mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

var cell_xbuff = (cell_size+x_buffer)*scale;
var cell_ybuff = (cell_size+y_buffer)*scale;

if(mousex < 947){
	var i_mousex = mousex - slots_x;
	var i_mousey = mousey - slots_y;
	is_over_crafting = false;
}
else {
	var i_mousex = mousex - craft_slots_x;
	var i_mousey = mousey - craft_slots_y;
	is_over_crafting = true;	
}


//show_debug_message("i_x: "+string(i_mousex)+" i_y: "+string(i_mousey)+" m_x: "+string(mousex)+" m_y: "+string(mousey)+" craftin? "+ string(is_over_crafting));

var nx = i_mousex div cell_xbuff ;
var ny = i_mousey div cell_ybuff ;
//show_debug_message("nx: "+string(nx)+" ny: "+string(ny));

if(nx >= 0 && nx < (is_over_crafting ? craft_slots_width : inv_slots_width) && ny >= 0 && ny < (is_over_crafting ? craft_slots_height : inv_slots_height)){
	var sx = i_mousex - (nx*cell_xbuff);
	var sy = i_mousey - (ny*cell_ybuff);
	//show_debug_message("sx: "+string(sx)+" sy: "+string(sy));

	if((sx < cell_size*scale) && (sy < cell_size*scale)){
		m_slotx = nx;
		m_sloty = ny;
	}
	
}


//set selected slot to mouse position
selected_slot = min((is_over_crafting ? craft_slots : inv_slots)-1,m_slotx + (m_sloty*(is_over_crafting ? craft_slots_width : inv_slots_width))); // prevents inaccessible slots from being hovered

#endregion

//Pickup Item

var from_grid = selected_from == "craft" ?  ds_crafting: ds_inventory;
var inv_grid = is_over_crafting ? ds_crafting: ds_inventory;
var ss_item = inv_grid[#0 , selected_slot];

if(pickup_slot != -1){
	if(mouse_check_button_pressed(mb_left)){
		if(ss_item == item.none){
			show_debug_message("Pickup case 1");
			inv_grid[# 0, selected_slot] = from_grid[# 0, pickup_slot];
			inv_grid[# 1, selected_slot] = from_grid[# 1, pickup_slot];
			
			from_grid[# 0, pickup_slot] = item.none;
			from_grid[# 1, pickup_slot] = 0;
			pickup_slot = -1;
			selected_from = "";
		}
		else if (selected_slot == pickup_slot){
			show_debug_message("Pickup case 2");
			pickup_slot = -1;
		}
		else {
			show_debug_message("Pickup case 3");
			var ss_item_num = from_grid[# 1, pickup_slot];
			inv_grid[# 0, selected_slot] = from_grid[# 0, pickup_slot];
			inv_grid[# 1, selected_slot] = from_grid[# 1, pickup_slot];
			
			from_grid[# 0, pickup_slot] = ss_item;
			from_grid[# 1, pickup_slot] = ss_item_num;	
		}
	}
}
else if( ss_item != item.none){
	if(mouse_check_button_pressed(mb_left)){
		pickup_slot = selected_slot;
		selected_from = is_over_crafting ? "craft": "inventory";
	}
	else if(mouse_check_button_pressed(mb_right)){
		var droppedobj = instance_create_depth(obj_player.x,obj_player.y,-100, obj_resource);
		
		droppedobj.item_id = inv_grid[# 0, selected_slot];
		droppedobj.is_placed = true;
		
		inv_grid[# 0, selected_slot] = 0;
		inv_grid[# 1, selected_slot] = 0;
	}
}

if(keyboard_check_pressed(vk_enter)){
	var found_items = 0;
	for(var i = 0 ; i<craft_slots; i++){
		if(ds_crafting[# 0, i] != 0){
			found_items ++;
		}
	}
	if(found_items == 3){
		is_crafting = true;
		var craft_total = 0;
		for(var i = 0 ; i<craft_slots; i++){
			if(ds_crafting[# 0, i] != 0){
				craft_total += (ds_crafting[# 0, i] *2) +37;
			}
		}
		for(var i = 0; i < num_recipes; i++ ){
			show_debug_message("Craft-Total:"+string(craft_total)+" comparing "+ string(ds_crafting_recipes[# 0, i]));
			if(ds_crafting_recipes[# 0, i] == craft_total){
				show_debug_message("Found a recipe. Craft-Total:"+string(craft_total));
				item_crafting = ds_crafting_recipes[# 1, i];
				
			}
		}
		for(var i = 0; i < craft_slots; i++ ){
			if(ds_crafting[# 0, i] != 0){
				if(ds_crafting[# 1, i] == 1){
					ds_crafting[# 1, i] = 0;
					ds_crafting[# 0, i] = 0;
				}
				else {
					ds_crafting[# 1, i] = ds_crafting[# 1, i]-1;
				}
			}
		}
	}
}
if(is_crafting){
	craft_timer++;
	
	if(craft_timer >= craft_timer_max){
		if(item_crafting != -1){
			addToInventory(item_crafting, 1);	
			item_crafting = -1;
		}
		craft_timer = 0;
		is_crafting = false;
	}
}
