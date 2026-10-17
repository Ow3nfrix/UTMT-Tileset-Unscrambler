window_set_size(room_width, room_height)
camera_set_view_size(view_camera[0], room_width, room_height)
surface_resize(application_surface, room_width, room_height)

window_center()
separation = 2
tilesize = 32
info = []
surface = -4
tileset_width = 0
mouse_start_x = 0
mouse_start_y = 0
offset_x = 0
offset_y = 0
mouse_prevx = 0
mouse_prevy = 0
moving = false
tileset_height = 0
tileset_sprite = -4
saved_path = ""
fix_tileset = function(path) { // ts :broken_herat:
	if path == ""
		exit;
	saved_path = path
	tileset_sprite = sprite_add(saved_path, 0, false, false, 0, 0)
	var xx = separation
	var yy = separation
	var w = sprite_get_width(tileset_sprite)
	var h = sprite_get_height(tileset_sprite)
	tileset_width = w
	tileset_height = h
	info = []
	var ogX = 0
	var ogY = 0
	while xx < w {
		array_push(info, [xx, yy])
		xx += tilesize + (separation * 2)
		ogX += tilesize
		if xx > w {
			xx = separation
			ogX = 0
			yy += tilesize + (separation * 2)
			ogY += tilesize
		}
		if yy > h {
			break;	
		}
	}
}
buttons = []
make_button = function(nm, xx, yy, onclickk) constructor {
	
	x = xx
	y = yy
	name = nm
	static update = function() {
		
	}
	onclick = onclickk
	array_push(other.buttons, self)
	return self;
}
save_tileset = function(path) {
	if path == ""
		exit;
	var surf = surface_create(sprite_get_width(tileset_sprite), sprite_get_height(tileset_sprite))
	surface_set_target(surf)
	draw_clear_alpha(c_black, 0) 
	var xx = 0
	var yy = 0
	for (var i = 0; i < array_length(info); i++) {
		draw_sprite_part(tileset_sprite, 0, info[i][0], info[i][1], tilesize, tilesize, xx, yy)
		xx += tilesize
		if xx > tileset_width {
			xx = 0
			yy += tilesize
		}
	}
	surface_reset_target()
	surface_save_ns(surf, path + ".png")
	surface_free(surf)
}
draw_set_font(fnt_normal)
zoom = 1
var padd = 32 + (2 * 2)
var yy = 540 -64
new make_button("Import Tile-Set",  32, yy, function() {
	fix_tileset(get_open_filename("Image File|*.png", ""))
})
yy -= padd
new make_button("Export Tile-Set", 32, yy, function() {
	save_tileset(get_save_filename("Filename", "tileset"))
})
yy -= padd
new make_button("Shrink Width", 32, yy, function() {
	tileset_width -= tilesize
	tileset_height += tilesize
})
new make_button("Expand Width", 32 + 150, yy, function() {
	tileset_width += tilesize
	tileset_height -= tilesize
})
yy -= padd
new make_button("Tile Size: 32", 32, yy, function(ID) {
	with ID {
		var old_str = string_trim(string_split(name, ":")[1])
		var val = get_string("Tile Size", old_str)
	}
	if val != "" {
		tilesize = real(val)
		with ID {
			name = string_replace(name, old_str, string(other.tilesize))	
		}
		fix_tileset(saved_path)
	}
})
yy -= padd
new make_button("Tile Separation: 2", 32, yy, function(ID) {
	with ID {
		var old_str = string_trim(string_split(name, ":")[1])
		var val = get_string("Tile Separation", old_str)
	}
	if val != "" {
		separation = real(val)
		with ID {
			name = string_replace(name, old_str, string(other.separation))	
		}
		fix_tileset(saved_path)
	}
})
yy -= padd