// add diff varible for origin_x and y
// figure whats wrong with moving


// checks if player is close to monster
/*
if collision_circle(x ,y,5,obj_player,false,false) {
	swi_di = 10
	// instance_destroy(obj_player);
}
*/

// makes it go right

// Movements for enemy



if (swi_di == 1 ) {
	origin_x += 1;
	x = origin_x;
	counter += 1;
	if counter >= counter_max {
		swi_di = 2
	}
}

// makes it go left
if swi_di == 2 {
	origin_x -= 1;
	x = origin_x;
	counter -= 1;
	if counter < counter_min {
		swi_di = 3
	}
}

// goes down
if swi_di == 3 {
	origin_y += 1;
	y = origin_y;
	counter += 1;
	if counter >= counter_max {
		swi_di = 4
	}
}
// goes up
if swi_di == 4 {
	origin_y -= 1;
	y = origin_y;
	counter -= 1;
	if counter < counter_min {
		swi_di = 1
	}
}



// Movements for enemy



// Switch direction to going after 
//if collision_rectangle(x - rec_dis, y - rec_dis, x + rec_dis, y + rec_dis, obj_player,false,false)
//

if collision_circle(x, y, 140, obj_player,true,true) and swi_di > 0 {
	swi_di = 0;
	//mp_linear_step(obj_player.x + 1 , obj_player.y + 1, 1, false);
	//move_towards_point(obj_player.x , obj_player.y + 1, 1);
	counter = 0; // reset counter for above steps
}


// Switch direction to going after 




// makes it so if the players is far a certain distance away
// the monster will go back to its origin

//ply_x = obj_player.x;
//ply_y = obj_player.y;



if swi_di == 0{
	
	//mp_linear_step(obj_player.x + 1 , obj_player.y + 1, 1, false);
	//move_towards_point(ply_x,ply_y, 1);
	//mp_potential_step_object(obj_player.x, obj_player.y, 1, obj_wall)
	//move_towards_point(obj_player.x,obj_player.y, 1);
	
	
	direction = point_direction(x,y,obj_player.x,obj_player.y);
	speed = 1;
	//motion_set(dir,2)

	
	if m_counter > m_counter_max {
		audio_play_sound(snd_monster,3,false);
		audio_sound_pitch(snd_monster, 4.0);
		m_counter = 0;
	}
		
	m_counter += 1
	if not collision_circle(x + 0,y + 0,cir_away, obj_player,false,true){
		swi_di = -7;
	}
	
}


	





if swi_di = -7 {
	move_towards_point(o_x,o_y, ret_spd)
	spn_cnt += 1;
	if spn_cnt >= spn_cnt_max {
		instance_create_depth(o_x,o_y,0,obj_monster);
		instance_destroy();
		counter = 0; // reset counter for above steps
		spn_cnt = 0;

		
		
	}
}



// also play with putting true
// collision_circle(x1, y1, rad, obj, prec, notme);

/* 
if collision_circle(x, y, 20, obj_Cursor, false, true)
   {
   image_index = 1;
   }
else image_index = 0;
*/




/*
collision_rectangle(x1, y1, x2, y2, obj, prec, notme);

var inst;
inst = collision_rectangle(50, 50, 200, 100, obj_Ball, false, true);
if inst != noone
   {
   with (inst) instance_destroy();
   }
*/

	/*
	if en_swi == 1 {
		move_towards_point(obj_player.x,obj_player.y, 3);
		*/