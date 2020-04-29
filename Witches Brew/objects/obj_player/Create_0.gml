walk_speed = 1;
norm_speed = 2;
run_speed = 3;
spd = 0;
x_spd = 0;
y_spd = 0;

x_frame = 0; 
y_frame = 9;

pickup_timer = 0;
pickup_timer_max = 30;

inv_slots = 17;

globalvar ds_inventory;
ds_inventory = ds_grid_create(2,inv_slots);