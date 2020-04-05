var cellsize = 32;

if(isVisible){
	draw_sprite_part_ext(spr_inv_UI, 0, cell_size, 0, inv_UI_width, inv_UI_height, 
inv_UI_x, inv_UI_y,scale, scale, c_white, 1);
}

var c = c_black;

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
	if(iitem > 0) {
		draw_sprite_part_ext(
			spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1
		);
	}
	
	//draw item number
	if(iitem > 0){
		var number = inv_grid[#1, ii];
		draw_text_color(xx,yy,string(number), c, c, c, c, 1); 
	}
	
	ii++;
	ix = ii mod inv_slots_width;
	iy = ii div inv_slots_width 
}