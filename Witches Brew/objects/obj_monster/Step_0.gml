// add diff varible for origin_x and y
// figure whats wrong with moving
if (swi_di == 1 ) {
	origin_x += 1;
	x = origin_x;
	counter += 1;
	if counter >= counter_max {
		swi_di = 2
	}
}


if swi_di == 2 {
	origin_x -= 1;
	x = origin_x;
	counter -= 1;
	if counter < counter_min {
		swi_di = 1
	}
}

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