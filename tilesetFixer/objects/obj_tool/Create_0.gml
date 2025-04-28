window_set_size(960, 540)
font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.!<>'?()[]", 1, 3);
button_array = []
loading = false
path = ""
grid_surface = -4
zoom = 1

function tool_init(loadImage = false)
{
	if !loadImage
		ts = -4
	surface = -4
	surface_w = 0 
	surface_h = 0
	if loadImage
	{
		surface_w = sprite_get_width(ts)
		surface_h = sprite_get_height(ts)
	}
	tile_array = []
	export_width = surface_w
	export_height = surface_h
	x_padding = 0
	offset_y = 0
	offset_x = 0
	mouse_start_x = 0
	mouse_start_y = 0
	moving = false
}
function create_button(name, xx, yy, func)
{
	array_push(button_array, {
		text : name,
		func : func,
		x : xx,
		y : yy,
		width : string_width(name) + 32,
		height : 32,
	})
}
function load_array()
{
	while ((export_width + x_padding) % 32) != 0
		x_padding++
	var tile_x = 2
	var tile_y = 2
	for (var i = 0; i < (surface_w * surface_h) / (36); i++)
	{
		array_push(tile_array, [tile_x, tile_y])
		tile_x += 4 + 32
		if tile_x > sprite_get_width(ts) - 2
		{
			tile_x = 2
			tile_y += 4 + 32
		}
	}
}

draw_set_font(font)
var pad = 8
var yy = 540
create_button("Import", pad, yy - pad - 32, function () {
	path = get_open_filename("Image File|*.png", "")
	if path != ""
	{
		alarm[0] = 15
		loading = true
	}
})
yy -= 64
create_button("Export", pad, yy - pad - 32, function () {
	var spr = sprite_create_from_surface(surface, 0, 0, export_width + x_padding, export_height, false, false, 0, 0)
	var p = get_string("Filename", "tileset")
	if p != ""
		sprite_save(spr, 0, p + ".png")
})
yy -= 64
create_button("+", pad, yy - pad - 32, function () {
	zoom += 0.1
})
yy -= 64
create_button("-", pad, yy - pad - 32, function () {
	zoom -= 0.1
})
tool_init()


