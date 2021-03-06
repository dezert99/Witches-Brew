// varibles for x and y location\

ply_x = x;
ply_y = y;



left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));

run = keyboard_check(vk_shift);
walk = keyboard_check(vk_lcontrol);



if(walk || run){
	spd = abs((walk*walk_speed) - (run*run_speed));
}
else {
	spd = norm_speed;	
}



if(pickup_timer <= 0){
	x_spd = 0;
	y_spd = 0;
	
	y_spd = (down - up) * spd;
	if(y_spd == 0){
		x_spd = (right - left) * spd;	
	}
}



if(place_meeting(x+x_spd,y,obj_collidable)){
	repeat(abs(x_spd)){
		if(!place_meeting(x+sign(x_spd),y,obj_collidable)){
			x+= sign(x_spd);
		}
		else{
			break	
		}
	}
	x_spd = 0;
}

if(place_meeting(x,y+y_spd,obj_collidable)){
	repeat(abs(y_spd)){
		if(!place_meeting(x,y+sign(y_spd),obj_collidable)){
			y+= sign(y_spd);
		}
		else{
			break	
		}
	}
	y_spd = 0;
}

if(pickup_timer <= 0){
	x += x_spd;
	y += y_spd;
}	
else {
	pickup_timer--;
}

// telepots player to 1st room when it touches an enemy
enemy = collision_rectangle(x,y,x+32,y+32,obj_monster,false,true)
if enemy {
	inv_slots -= 1;
	if(inv_slots <=3){
		game_restart();	
	}
	if(held_items > inv_slots){
		held_items = inv_slots;	
	}
	
	instance_destroy(enemy);
}


// monster

