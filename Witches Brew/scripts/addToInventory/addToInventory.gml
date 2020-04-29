var itemID = argument0;
var quantity = argument1;

for(var i = 0; i < obj_player.inv_slots; i++){
	if(ds_inventory[# 0,i] == 0){
		ds_inventory[# 0,i] = itemID
		ds_inventory[# 1,i] = quantity;
		obj_player.pickup_timer = obj_player.pickup_timer_max;
		return;
	}
}