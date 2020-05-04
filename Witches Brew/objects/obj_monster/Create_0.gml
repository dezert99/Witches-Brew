origin_x = x;
origin_y = y;

swi_di = 1;
counter = 0;

counter_max = 100;
counter_min = -1 * counter_max;

o_x = x;
o_y = y;

cir_rad = 140; // radius of enemy going after player
cir_away = 200; // raduis of when enemy goes back to spawn

ret_spd = .8 // how fast enemy goes back to origin

m_counter = 501; // counter for monster roar
m_counter_max = 500

ply_fl_counter = 251; // counter for speed switch in enemy movement chasing player
ply_fl_counter_max = 250; // counter for speed switch in enemy movement chasing player

en_swi = 0; // counter to switch beetween enemy normal speed and sprint burst

spn_cnt = 0;
spn_cnt_max = 500;