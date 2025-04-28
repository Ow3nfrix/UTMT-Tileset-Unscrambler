if !sprite_exists(ts)
	exit;
if keyboard_check_pressed(ord("Q"))
{
	export_width -= 32
	export_height += 32	
	surface = -4
}
if keyboard_check_pressed(ord("W"))
{
	export_width += 32
	export_height -= 32		
	surface = -4
}
if keyboard_check_pressed(ord("A"))
{
	x_padding -= 32//real(get_string("extra padding", x_padding))
	surface = -4
}
if keyboard_check_pressed(ord("S"))
{
	x_padding += 32//real(get_string("extra padding", x_padding))
	surface = -4
}
if keyboard_check_pressed(ord("E"))
{
	var spr = sprite_create_from_surface(surface, 0, 0, export_width + x_padding, export_height, false, false, 0, 0)
	sprite_save(spr, 0, get_string("Filename", "tileset") + ".png")
}
if mouse_check_button(mb_left)
{
	if !moving
	{
		mouse_start_x = mouse_x - offset_x;
		mouse_start_y = mouse_y - offset_y;
		moving = true
	}

	offset_x = mouse_x - mouse_start_x
	offset_y = mouse_y - mouse_start_y
}
else
	moving = false
