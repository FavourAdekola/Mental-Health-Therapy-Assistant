extends Sprite2D

var drawing_texture: ImageTexture
var drawing_canvas: Image
var drawing := false
var line_thickness := 100
var line_color := Color(1, 0, 0) # Red color, change as desired

func _ready():
	drawing_canvas = Image.create(800, 600, false, Image.FORMAT_RGBA8) # Set the size of your canvas
	drawing_canvas.fill(Color.WHITE)

	drawing_texture = ImageTexture.create_from_image(drawing_canvas)
	texture = drawing_texture

func _input(event):
	if Input.is_action_pressed("Click"):
		drawing = true
	if Input.is_action_just_released("Click"):
		drawing = false

	if event is InputEventMouseMotion and drawing:
		var pos = event.position
		draw_on_canvas(pos)

func draw_on_canvas(pos: Vector2):
	var draw_pos = pos.floor()
	for x in range(-line_thickness, line_thickness):
		for y in range(-line_thickness, line_thickness):
			drawing_canvas.set_pixel(draw_pos.x + x, draw_pos.y + y, line_color)
	drawing_texture.create_from_image(drawing_canvas)
	
func _physics_process(delta):
	texture = drawing_texture





