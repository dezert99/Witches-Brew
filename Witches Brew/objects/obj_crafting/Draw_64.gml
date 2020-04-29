if(!isVisible) exit;

var cellsize = 32;


	draw_sprite_part_ext(spr_inv_UI, 0, cell_size, 0, inv_UI_width, inv_UI_height, 
inv_UI_x, inv_UI_y,scale, scale, c_white, 1);


var c = c_black;

//Regular inv
var ii, ix, iy, xx, yy,sx, sy, iitem, inv_grid;
ii = 0; ix = 0; iy = 0; inv_grid = ds_inventory
repeat(inv_slots){
	
	xx = slots_x + ((cell_size+x_buffer)*ix*scale);
	yy = slots_y + ((cell_size+y_buffer)*iy*scale);
	
	iitem = inv_grid[# 0, ii];
	sx = (iitem mod spr_inv_items_columns)*cell_size;
	sy = (iitem div spr_inv_items_columns)*cell_size;
	
	//draw slot and item
	draw_sprite_part_ext(spr_inv_UI, 0, 0, 0, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
	
	switch(ii){
		case selected_slot:
			if(iitem > 0) {
				draw_sprite_part_ext(
					spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1
				);
			}
			
			if(!is_over_crafting){
				gpu_set_blendmode(bm_add);
				draw_sprite_part_ext(spr_inv_UI, 0, 0, 0, cell_size, cell_size, xx, yy, scale, scale, c_white, .3);
				gpu_set_blendmode(bm_normal);
			}
			break;
			
		case (pickup_slot):
			if(selected_from == "inventory"){
				break;
			}
		
		default:
			if(iitem > 0) {
				draw_sprite_part_ext(
					spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1
				);
			}
			break;
	}
	
	
	//draw item number
	//if(iitem > 0 && (pickup_slot != ii || selected_from != "inventory" )){
	//	var number = inv_grid[#1, ii];
	//	draw_text_color(xx,yy,string(number), c, c, c, c, 1); 
	//}
	
	ii++;
	ix = ii mod inv_slots_width;
	iy = ii div inv_slots_width 
}

//Crafting

var ii, ix, iy, xx, yy,sx, sy, iitem, inv_grid;
ii = 0; ix = 0; iy = 0; inv_grid = ds_crafting; xx = 400;
repeat(craft_slots){
	
	xx = craft_slots_x + ((cell_size+x_buffer)*ix*scale);
	yy = craft_slots_y + ((cell_size+y_buffer)*iy*scale);
	
	iitem = inv_grid[# 0, ii];
	sx = (iitem mod spr_inv_items_columns)*cell_size;
	sy = (iitem div spr_inv_items_columns)*cell_size;
	
	//draw slot and item
	draw_sprite_part_ext(spr_inv_UI, 0, 0, 0, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
	
	switch(ii){
		case selected_slot:
			if(iitem > 0) {
				draw_sprite_part_ext(
					spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1
				);
			}
			if(is_over_crafting){
				gpu_set_blendmode(bm_add);
				draw_sprite_part_ext(spr_inv_UI, 0, 0, 0, cell_size, cell_size, xx, yy, scale, scale, c_white, .3);
				gpu_set_blendmode(bm_normal);
			}
			break;
			
		case (pickup_slot):
			if(selected_from == "craft"){
				break;
			}
		
		default:
			if(iitem > 0) {
				draw_sprite_part_ext(
					spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1
				);
			}
			break;
	}
	
	
	//draw item number
	//if(iitem > 0 && (pickup_slot != ii || selected_from != "craft" )){
	//	var number = inv_grid[#1, ii];
	//	draw_text_color(xx,yy,string(number), c, c, c, c, 1); 
	//}
	
	ii++;
	ix = ii mod craft_slots_width;
	iy = ii div craft_slots_width 
}

var from_grid = selected_from == "craft" ?  ds_crafting: ds_inventory;
mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);
if(pickup_slot != -1){
	iitem = from_grid[# 0, pickup_slot];
	sx = (iitem mod spr_inv_items_columns)*cell_size;
	sy = (iitem div spr_inv_items_columns)*cell_size;
	draw_sprite_part_ext(
		spr_inv_items, 0, sx, sy, cell_size, cell_size, mousex, mousey, scale, scale, c_white, 1
	);
	var inum = from_grid[# 1, pickup_slot];
	draw_text_color(mousex,mousey,string(inum), c, c, c, c, 1); 
}

if(is_crafting){
	draw_healthbar(craft_slots_x,craft_slots_y+110,craft_slots_x+310, craft_slots_y+160,(craft_timer/craft_timer_max)*100,c_black,c_aqua,item_crafting == -1 ? c_red : make_color_rgb(168,230,91), 0,true, true);
}





