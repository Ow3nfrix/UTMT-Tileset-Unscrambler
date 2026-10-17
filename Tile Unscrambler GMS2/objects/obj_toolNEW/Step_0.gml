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
var old_zoom_x = 960 * zoom
var old_zoom_y = 540 * zoom
if mouse_wheel_down() {
	zoom += 0.1
	offset_x -= (old_zoom_x - (960 * zoom))
	offset_y -= (old_zoom_y - (540 * zoom))

}
	
if mouse_wheel_up() {
	zoom -= 0.1
	offset_x -= (old_zoom_x - (960 * zoom))
	offset_y -= (old_zoom_y - (540 * zoom))
}
camera_set_view_size(view_camera[0], 960 * zoom, 540 * zoom)