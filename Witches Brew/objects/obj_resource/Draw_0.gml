var sx = (item_id mod spr_inv_items_columns)*cell_size;
var sy = (item_id div spr_inv_items_columns)*cell_size;

draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, x, y, scale, scale, c_white, 1);