for (var i = 0; i < array_length(buttons); i++) {
	with buttons[i] {
		var pad = 2
		draw_set_font(fnt_normal)
		var rectangleColor = c_white
		var x1 = x - pad
		var y1 = y - pad
		var x2 = x + string_width(name) + (pad * 2)
		var y2 = y + 32 + pad
		if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), x1, y1, x2, y2) {
			rectangleColor = c_gray
			if mouse_check_button_pressed(mb_left)
				onclick(self)
		}
		draw_rectangle_colour(x1, y1, x2, y2, rectangleColor, rectangleColor, rectangleColor, rectangleColor, false)	
		draw_set_colour(c_black)
		draw_text(x, y + 6, name)
	}
}