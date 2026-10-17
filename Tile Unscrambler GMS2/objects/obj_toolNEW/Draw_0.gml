for (var i = 0; i < 2000; i += tilesize) {
	for (var j = 0; j < 2000; j += tilesize) {
		draw_set_colour(c_white)
		draw_line(i+ offset_x, j+ offset_y, i+ offset_x + tilesize, j + offset_y)
		draw_line(i+ offset_x, j+ offset_y, i+ offset_x, j + tilesize + offset_y)
	}
}
var xx = 0
var yy = 0
for (var i = 0; i < array_length(info); i++) {
	draw_set_colour(c_black)
	draw_set_alpha(0.5)
	draw_rectangle(xx + offset_x, yy + offset_y, xx + offset_x + 31, yy + offset_y + 31, false)
	draw_set_colour(c_white)
	draw_set_alpha(1)
	draw_sprite_part(tileset_sprite, 0, info[i][0], info[i][1], tilesize, tilesize, xx + offset_x, yy + offset_y)
	xx += tilesize
	if xx > tileset_width {
		xx = 0
		yy += tilesize
	}
}