var itemID = argument0;
var quantity = argument1;

for(var i = 0; i < obj_inventory.item.height; i++){
	if(obj_inventory.ds_inventory[# 0,i] == itemID){
		obj_inventory.ds_inventory[# 1,i] = obj_inventory.ds_inventory[# 1,i]+quantity;
		return;
	}
}

for(var i = 0; i < obj_inventory.item.height; i++){
	if(obj_inventory.ds_inventory[# 0,i] == 0){
		obj_inventory.ds_inventory[# 0,i] = itemID
		obj_inventory.ds_inventory[# 1,i] = quantity;
		return;
	}
}