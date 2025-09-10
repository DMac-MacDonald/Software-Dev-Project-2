extends Node2D

const GOOBLER = preload("res://Scenes/goobler.tscn")
var rng = RandomNumberGenerator.new()
func spawn_goobler(rand:bool,type:int, num:int):
	for i in num:
		var random = int(rng.randf_range(0,3))
		if rand:
			match random:
				0:#type:Blue
					var goobler = GOOBLER.instantiate()
					goobler.goobler_type = 0
					get_parent().add_child(goobler)
					goobler.position = position
				1:#type:Red
					var goobler = GOOBLER.instantiate()
					goobler.goobler_type = 1
					get_parent().add_child(goobler)
					goobler.position = position
				2:#type:Yellow
					var goobler = GOOBLER.instantiate()
					goobler.goobler_type = 2
					get_parent().add_child(goobler)
					goobler.position = position
				3:#type:Green
					var goobler = GOOBLER.instantiate()
					goobler.goobler_type = 3
					get_parent().add_child(goobler)
					goobler.position = position
				4:#type:Orange
					var goobler = GOOBLER.instantiate()
					goobler.goobler_type = 4
					add_child(goobler)
		else:
			match type:
				0:#type:Blue
					var goobler = GOOBLER.instantiate()
					goobler.goobler_type = 0
					get_parent().add_child(goobler)
					goobler.position = position
				1:#type:Red
					var goobler = GOOBLER.instantiate()
					goobler.goobler_type = 1
					get_parent().add_child(goobler)
					goobler.position = position
				2:#type:Yellow
					var goobler = GOOBLER.instantiate()
					goobler.goobler_type = 2
					get_parent().add_child(goobler)
					goobler.position = position
				3:#type:Green
					var goobler = GOOBLER.instantiate()
					goobler.goobler_type = 3
					get_parent().add_child(goobler)
					goobler.position = position
				4:#type:Orange
					var goobler = GOOBLER.instantiate()
					goobler.goobler_type = 4
					add_child(goobler)
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
