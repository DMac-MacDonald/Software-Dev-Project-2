extends Node2D

const BGOOBLER = preload("res://Scenes/blue_goobler.tscn")
const RGOOBLER = preload("res://Scenes/red_goobler.tscn")
const YGOOBLER = preload("res://Scenes/yellow_goobler.tscn")
const GGOOBLER = preload("res://Scenes/green_goobler.tscn")
const OGOOBLER = preload("res://Scenes/orange_goobler.tscn")
var rng = RandomNumberGenerator.new()
func spawn_goobler(rand:bool,type:int, num:int):
	for i in num:
		var random = int(rng.randf_range(0,13))
		if rand:
			match random:
				0,1:#type:Blue
					var blue_goobler = BGOOBLER.instantiate()
					
					get_parent().add_child(blue_goobler)
					blue_goobler.position = position
				12:#type:Red
					var red_goobler = RGOOBLER.instantiate()
					
					get_parent().add_child(red_goobler)
					red_goobler.position = position
				2,3,5:#type:Yellow
					var yellow_goobler = YGOOBLER.instantiate()
					
					get_parent().add_child(yellow_goobler)
					yellow_goobler.position = position
				7,9:#type:Green
					var green_goobler = GGOOBLER.instantiate()
					
					get_parent().add_child(green_goobler)
					green_goobler.position = position
				4,6,8,10:#type:Orange
					var orange_goobler = OGOOBLER.instantiate()
					
					get_parent().add_child(orange_goobler)
					orange_goobler.position = position
		else:
			print("Type:" + str(type))
			match type:
				0:#type:Blue
					var blue_goobler = BGOOBLER.instantiate()
					
					get_parent().add_child(blue_goobler)
					blue_goobler.position = position
				1:#type:Red
					var red_goobler = RGOOBLER.instantiate()
					
					get_parent().add_child(red_goobler)
					red_goobler.position = position
				2:#type:Yellow
					var yellow_goobler = YGOOBLER.instantiate()
					
					get_parent().add_child(yellow_goobler)
					yellow_goobler.position = position
				3:#type:Green
					var green_goobler = GGOOBLER.instantiate()
					
					get_parent().add_child(green_goobler)
					green_goobler.position = position
				4:#type:Orange
					var orange_goobler = OGOOBLER.instantiate()
					
					get_parent().add_child(orange_goobler)
					orange_goobler.position = position
func randomize_pos():
	var random = int(rng.randf_range(0,3))
	match random:
		0:
			randomize_top()
		1:
			randomize_right()
		2:
			randomize_bottom()
		3:
			randomize_left()
func randomize_top():
	var randomx = rng.randf_range(0,2700)
	position.y = 0
	position.x = randomx
func randomize_bottom():
	var randomx = rng.randf_range(0,2700)
	position.y = 2400
	position.x = randomx
func randomize_left():
	var randomy = rng.randf_range(0,2400)
	position.y = randomy
	position.x = 0
func randomize_right():
	var randomy = rng.randf_range(0,2400)
	position.y = randomy
	position.x = 2700
