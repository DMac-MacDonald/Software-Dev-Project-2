extends CharacterBody2D


var speed = 300.0
const ZOOM_RATE = .1


@onready var camera:Camera2D = %Camera2D

var is_moving : bool = false
var drawing: bool = false
func _physics_process(delta: float) -> void:
	speed = Global.marker_speed
	#check if player is moving
	if velocity.x > 0 or velocity.y > 0:
		is_moving = true
	else:
		is_moving = false
		# Get the input direction and handle the movement/deceleration.
		
	#zoom camera in and out
	if Input.is_action_just_pressed("zoom_in"):
		camera.zoom.x += ZOOM_RATE
		camera.zoom.y += ZOOM_RATE
	if Input.is_action_just_pressed("zoom_out"):
		camera.zoom.x -= ZOOM_RATE
		camera.zoom.y -= ZOOM_RATE
		
	#move left and right
	var directionX := Input.get_axis("left", "right")
	if directionX:
		velocity.x = directionX * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	#move up and down
	var directionY := Input.get_axis("up", "down")
	if directionY:
		velocity.y = directionY * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)
	move_and_slide()
	#change pixel color
	if Input.is_action_just_pressed("pixel_1"):
		Global.current_pix_color = "default"
	if Input.is_action_just_pressed("pixel_2"):
		Global.current_pix_color = "red"
	if Input.is_action_just_pressed("pixel_3"):
		Global.current_pix_color = "blue"
	if Input.is_action_just_pressed("pixel_4"):
		Global.current_pix_color = "green"
	if Input.is_action_just_pressed("pixel_5"):
		Global.current_pix_color = "yellow"
	if Input.is_action_just_pressed("pixel_6"):
		Global.current_pix_color = "brown"
	#drawing
	if Input.is_action_pressed("draw") and Global.ink > 0:
		drawing = true
	else:
		drawing = false
		
