

scale = 3;
cell_size = 32; 
inv_UI_width = 308;
inv_UI_height = 170;

inv_slots = 12;
inv_slots_width = 3;
inv_slots_height = 4;

craft_slots = 3;
craft_slots_width = 3;
craft_slots_height = 1;

selected_from = "";
selected_slot = 0;
pickup_slot = -1;
m_slotx = 0;
m_sloty = 0;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

spr_inv_UI = spr_crafting_new;
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

craft_slots_x = info_x+427;
craft_slots_y = inv_UI_y + (40*scale);

is_over_crafting = false;

x_buffer = 4;
y_buffer = 4;

isVisible = false;

ds_crafting = ds_grid_create(2,craft_slots);
ds_crafting_recipes = ds_grid_create(2,2);

//Chair
ds_crafting_recipes[# 0, 0] = 116;
ds_crafting_recipes[# 1, 0] = 11;

//Potion 4
ds_crafting_recipes[# 0, 1] = 171;
ds_crafting_recipes[# 1, 1] = 20;

ds_inventory[# 0, 0] = item.wood;
ds_inventory[# 1, 0] = 1;

ds_inventory[# 0, 1] = item.axe;
ds_inventory[# 1, 1] = 1;

ds_inventory[# 0, 2] = item.starfish;
ds_inventory[# 1, 2] = 1;

ds_inventory[# 0, 3] = item.chilli;
ds_inventory[# 1, 3] = 1;

ds_inventory[# 0, 4] = item.bucket;
ds_inventory[# 1, 4] = 1;

//for(i = 0; i < 5; i++){
//	ds_inventory[# 0, i] = irandom_range(1,item.height-1);
//	ds_inventory[# 1, i] = irandom_range(1,10);
//}

//for(i = 0; i < 3; i++){
//	ds_crafting[# 0, i] = irandom_range(1,item.height-1);
//	ds_crafting[# 1, i] = irandom_range(1,10);
//}

