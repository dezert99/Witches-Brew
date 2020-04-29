// add diff varible for origin_x and y
// figure whats wrong with moving


// checks if player is close to monster
if collision_circle(x ,y,5,obj_player,false,false) {
	swi_di = 10
	// instance_destroy(obj_player);
}


// makes it go right


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
		swi_di = 1
	}
}


/*
if collision_circle(x,y,100, obj_player,false,true) {
	swi_di = 0
	move_towards_point(obj_player.x,obj_player.y, 1)
}
*/

// make a statment that compares the mosnter and player so 
//the mosnter knows when to go back to its spot


if collision_circle(x + 0,y + 0,cir_rad, obj_player,false,true) and swi_di > 0 {
	swi_di = 0;
	move_towards_point(obj_player.x,obj_player.y, 1);
	counter = 0; // reset counter for above steps
}



// makes it so if the players is far a certain distance away
// the monster will go back to its origin
if swi_di == 0{
	move_towards_point(obj_player.x,obj_player.y, 1);
	if m_counter > 500 {
		audio_play_sound(snd_monster,3,false)
		audio_sound_pitch(snd_monster, 4.0);
		m_counter = 0
	}
	m_counter += 1
	if not collision_circle(x + 0,y + 0,cir_away, obj_player,false,true){
		swi_di = 7;
	}
}
if swi_di = 7 {
	move_towards_point(o_x,o_y, ret_spd)
	origin_x = o_x;
	origin_y = o_y;
	if collision_circle(o_x + 0,o_y + 0,60, obj_player,false,true) {
		swi_di = 1;
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

// if collision_circle(x, y, 20, obj_Cursor, false, true)