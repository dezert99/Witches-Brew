

scale = 2;
cell_size = 32; 
inv_UI_width = 288;
inv_UI_height = 192;

inv_slots = 17;
inv_slots_width = 8;
inv_slots_height = 3;

selected_slot = 0;
pickup_slot = -1;
m_slotx = 0;
m_sloty = 0;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

spr_inv_UI = spr_inventory_ui;
spr_inv_items = spr_placeholder_items

spr_inv_items_columns = sprite_get_width(spr_inv_items)/cell_size;
spr_inv_items_rows = sprite_get_height(spr_inv_items)/cell_size;

inv_UI_x = (gui_width/2) - (inv_UI_width*.5*scale)
inv_UI_y = (gui_height/2) - (inv_UI_height*.5*scale)

//can be used to draw info if we want
info_x = inv_UI_x + (9*scale);
//info_y = inv_UI_y + (9*scale);

slots_x = info_x;
slots_y = inv_UI_y + (40*scale);

x_buffer = 2;
y_buffer = 4;

isVisible = false;





//ds_inventory[# 0, 0] = item.bucket;
//ds_inventory[# 1, 0] = 1;

//for(i = 0; i < inv_slots; i++){
//	ds_inventory[# 0, i] = irandom_range(1,item.height-1);
//	ds_inventory[# 1, i] = irandom_range(1,10);
//}

