var itemID = argument0;
var quantity = argument1;

for(var i = 0; i < obj_crafting.inv_slots; i++){
	if(obj_crafting.ds_inventory[# 0,i] == itemID){
		obj_crafting.ds_inventory[# 1,i] = obj_crafting.ds_inventory[# 1,i]+quantity;
		return;
	}
}

for(var i = 0; i < obj_crafting.inv_slots; i++){
	if(obj_crafting.ds_inventory[# 0,i] == 0){
		obj_crafting.ds_inventory[# 0,i] = itemID
		obj_crafting.ds_inventory[# 1,i] = quantity;
		return;
	}
}