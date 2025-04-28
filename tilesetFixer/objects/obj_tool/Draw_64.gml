draw_set_font(font)
draw_sprite_tiled(spr_grid_export, 0, offset_x, offset_y)
draw_set_color(c_black)
draw_set_alpha(0.5)
draw_rectangle(offset_x, offset_y, offset_x + export_width + x_padding, offset_y + export_height, false)
draw_set_alpha(1)
if !surface_exists(surface)
{
	if array_length(tile_array) != 0
	{
		surface = surface_create(export_width + x_padding, export_height)
		surface_set_target(surface)
		var tile_x = 0
		var tile_y = 0
		draw_set_color(c_white)
		for (var i = 0; i < array_length(tile_array); i++)
		{
			var t = tile_array[i]
			draw_sprite_part(ts, 0, t[0], t[1], 32, 32, tile_x, tile_y)
			tile_x += 32
			if tile_x > export_width
			{
				tile_x = 0
				tile_y += 32
			}
			
		}
		surface_reset_target()
	}

}
else
	draw_surface_ext(surface, offset_x, offset_y, 1, 1, 0, c_white, 1)
draw_set_color(c_black)
draw_set_halign(1)
draw_set_valign(1)
for (var i = 0; i < array_length(button_array); i++)
{
	var b = button_array[i]
	var img = 0
	draw_sprite_stretched(spr_button, 0, b.x, b.y, b.width, b.height)
	draw_text(b.x + (b.width / 2), b.y + (b.height / 2), b.text)
	if point_in_rectangle(mouse_x, mouse_y, b.x, b.y, b.x + b.width, b.y + b.height) && mouse_check_button_pressed(mb_left)
		b.func()
}
if loading
{
	draw_set_alpha(0.5)
	draw_rectangle_color(0, 0, 960, 540, c_black, c_black, c_black, c_black, false)
	draw_set_alpha(1)
	draw_sprite(spr_loadingg, 0, irandom_range(-2, 2), 0)
}