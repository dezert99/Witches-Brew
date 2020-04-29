randomize();
scale = random_range(.25,.5);
cell_size = 32; 
spr_inv_items = spr_items

spr_inv_items_columns = sprite_get_width(spr_inv_items)/cell_size;
spr_inv_items_rows = sprite_get_height(spr_inv_items)/cell_size;

is_placed = false;

if(item_id == -1) {
	item_id = irandom_range(4,item.height-1);
}
quantity = 1; 

