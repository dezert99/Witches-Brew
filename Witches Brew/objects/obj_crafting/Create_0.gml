

scale = 3.5;
cell_size = 32; 
inv_UI_width = 308;
inv_UI_height = 170;

inv_slots_width = 3;
inv_slots_height = 3;

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
spr_inv_items = spr_items

spr_inv_items_columns = sprite_get_width(spr_inv_items)/cell_size;
spr_inv_items_rows = sprite_get_height(spr_inv_items)/cell_size;

inv_UI_x = (gui_width/2) - (inv_UI_width*.5*scale)+(os_type == os_windows ? 0 : 280)
inv_UI_y = (gui_height/2) - (inv_UI_height*.5*scale)+(os_type == os_windows ? 0 : 70)
//can be used to draw info if we want
info_x = inv_UI_x + (9*scale);
//info_y = inv_UI_y + (9*scale);

slots_x = info_x+45;
slots_y = inv_UI_y + (40*scale)+3;

craft_slots_x = info_x+493;
craft_slots_y = inv_UI_y + (40*scale)+255;

is_over_crafting = false;

x_buffer = 4;
y_buffer = 4;

isVisible = false;

ds_crafting = ds_grid_create(2,craft_slots);
num_recipes = 4;

ds_crafting_recipes = ds_grid_create(2,num_recipes);

display_set_gui_size(1920,1080);


//Chair
ds_crafting_recipes[# 0, 0] = 175;
ds_crafting_recipes[# 1, 0] = 1;

ds_crafting_recipes[# 0, 1] = 169;
ds_crafting_recipes[# 1, 1] = 3;

//Potion 4
ds_crafting_recipes[# 0, 2] = 229;
ds_crafting_recipes[# 1, 2] = 2;

//Potion 4
ds_crafting_recipes[# 0, 3] = 123;
ds_crafting_recipes[# 1, 3] = 24;


//Items
enum item {
	none = 0,
	potion1 = 1,
	potion2 = 2,
	potion3 = 3,
	glow_flower = 4,
	glow_root = 5,
	red_rock = 6,
	blue_rock = 7, 
	poop = 8,
	rainbow_shell = 9,
	worm = 10,
	green_worm = 11,
	glow_berry = 12,
	cold_berry = 13,
	grow_berry = 14,
	blue_flower = 15,
	r_mushroom = 16,
	o_mushroom = 17,
	b_mushroom = 18,
	g_mushroom = 19,
	twig = 20,
	flower2 = 21,
	luck_dice = 22,
	purple_rock = 23,
	final_pot = 24,
	height = 25 // allows us to get height of enumerator -- good trick
}

//Potion 1
ds_inventory[# 0, 0] = item.glow_berry;
ds_inventory[# 1, 0] = 1;

ds_inventory[# 0, 1] = item.r_mushroom;
ds_inventory[# 1, 1] = 1;

ds_inventory[# 0, 2] = item.glow_flower;
ds_inventory[# 1, 2] = 1;

//Potion 2
ds_inventory[# 0, 3] = item.luck_dice;
ds_inventory[# 1, 3] = 1;

ds_inventory[# 0, 4] = item.grow_berry;
ds_inventory[# 1, 4] = 1;

ds_inventory[# 0, 5] = item.purple_rock;
ds_inventory[# 1, 5] = 1;

//Potion 3
ds_inventory[# 0, 6] = 5;
ds_inventory[# 1, 6] = 1;

ds_inventory[# 0, 7] = 9;
ds_inventory[# 1, 7] = 1;

ds_inventory[# 0, 8] = 15;
ds_inventory[# 1, 8] = 1;

craft_timer = 0;
craft_timer_max = 400;
is_crafting = false;
item_crafting = -1;

//for(i = 0; i < 5; i++){
//	ds_inventory[# 0, i] = irandom_range(1,item.height-1);
//	ds_inventory[# 1, i] = irandom_range(1,10);
//}

//for(i = 0; i < 3; i++){
//	ds_crafting[# 0, i] = irandom_range(1,item.height-1);
//	ds_crafting[# 1, i] = irandom_range(1,10);
//}

