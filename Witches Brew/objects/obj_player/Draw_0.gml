var anim_length = 8;
var frame_size = 32;
var anim_speed = 12;

if(x_spd < 0){
	y_frame = 9;	
}
else if (x_spd > 0){
	y_frame = 11;	
}
else if (y_spd < 0){
	y_frame = 8;	
}
else if (y_spd > 0){
	y_frame = 10;	
}
else {
	x_frame = 0;	
}

//Can be expanded later for customized characters. 
draw_sprite_part(player_sprite_scaled, 100, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, x, y);

if(x_frame+(anim_length/60) < anim_length){
	x_frame += anim_speed/60;	
}
else {
	x_frame =1;	
}
