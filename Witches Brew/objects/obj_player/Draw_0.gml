var anim_length = 5;
var frame_size = 32;
var anim_speed = 4;

if(x_spd < 0){
	y_frame = 1;	
}
else if (x_spd > 0){
	y_frame = 2;	
}
else if (y_spd < 0){
	y_frame = 3;	
}
else if (y_spd > 0){
	y_frame = 0;	
}
else {
	x_frame = 0;	
}

//Can be expanded later for customized characters. 
draw_sprite_part(spr_spritesheet_new, 100, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, x, y);

if(x_frame+(anim_length/60) < anim_length){
	x_frame += anim_speed/60;	
}
else {
	x_frame =1;	
}

if(pickup_timer > 0){
	draw_healthbar(x,y-10,x+32,y-15,(1-(pickup_timer/pickup_timer_max))*100,c_black,c_red,c_green,0,true,false);
}
