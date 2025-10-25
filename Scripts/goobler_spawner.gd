extends Node2D

const BGOOBLER = preload("res://Scenes/blue_goobler.tscn")
const RGOOBLER = preload("res://Scenes/red_goobler.tscn")
const YGOOBLER = preload("res://Scenes/yellow_goobler.tscn")
const GGOOBLER = preload("res://Scenes/green_goobler.tscn")
const OGOOBLER = preload("res://Scenes/orange_goobler.tscn")
var rng = RandomNumberGenerator.new()
func spawn_goobler(rand:bool,type:int, num:int, size:float, health:float, speed:float):
	for i in num:
		var random = int(rng.randf_range(0,13))
		if rand:
			match random:
				0,1:#type:Blue
					var blue_goobler = BGOOBLER.instantiate()
					blue_goobler.set_stat("size",(Global.goobler_base_size + Global.goobler_base_size * size))
					blue_goobler.set_stat("health",(Global.goobler_base_health + Global.goobler_base_health * size))
					blue_goobler.set_stat("speed",(blue_goobler.speed + blue_goobler.speed * speed/2))
					get_parent().add_child(blue_goobler)
					blue_goobler.position = position
				12:#type:Red
					var red_goobler = RGOOBLER.instantiate()
					red_goobler.set_stat("size",(Global.goobler_base_size + Global.goobler_base_size * size))
					red_goobler.set_stat("health",(Global.goobler_base_health + Global.goobler_base_health * size))
					red_goobler.set_stat("speed",(red_goobler.speed + red_goobler.speed * speed/2))
					get_parent().add_child(red_goobler)
					red_goobler.position = position
				2,3,5:#type:Yellow
					var yellow_goobler = YGOOBLER.instantiate()
					yellow_goobler.set_stat("size",(Global.goobler_base_size + Global.goobler_base_size * size))
					yellow_goobler.set_stat("health",(Global.goobler_base_health + Global.goobler_base_health * size))
					yellow_goobler.set_stat("speed",(yellow_goobler.speed + yellow_goobler.speed * speed/2))
					get_parent().add_child(yellow_goobler)
					yellow_goobler.position = position
				7,9:#type:Green
					var green_goobler = GGOOBLER.instantiate()
					green_goobler.set_stat("size",(Global.goobler_base_size + Global.goobler_base_size * size))
					green_goobler.set_stat("health",(Global.goobler_base_health + Global.goobler_base_health * size))
					green_goobler.set_stat("speed",(green_goobler.speed + green_goobler.speed * speed/2))
					get_parent().add_child(green_goobler)
					green_goobler.position = position
				4,6,8,10:#type:Orange
					var orange_goobler = OGOOBLER.instantiate()
					orange_goobler.set_stat("size",(Global.goobler_base_size + Global.goobler_base_size * size))
					orange_goobler.set_stat("health",(Global.goobler_base_health + Global.goobler_base_health * size))
					orange_goobler.set_stat("speed",(orange_goobler.speed + orange_goobler.speed * speed/2))
					get_parent().add_child(orange_goobler)
					orange_goobler.position = position
		else:
			print("Type:" + str(type))
			match type:
				0,1:#type:Blue
					var blue_goobler = BGOOBLER.instantiate()
					blue_goobler.set_stat("size",(Global.goobler_base_size + Global.goobler_base_size * size))
					blue_goobler.set_stat("health",(Global.goobler_base_health + Global.goobler_base_health * size))
					blue_goobler.set_stat("speed",(blue_goobler.speed + blue_goobler.speed * speed/2))
					get_parent().add_child(blue_goobler)
					blue_goobler.position = position
				12:#type:Red
					var red_goobler = RGOOBLER.instantiate()
					red_goobler.set_stat("size",(Global.goobler_base_size + Global.goobler_base_size * size))
					red_goobler.set_stat("health",(Global.goobler_base_health + Global.goobler_base_health * size))
					red_goobler.set_stat("speed",(red_goobler.speed + red_goobler.speed * speed/2))
					get_parent().add_child(red_goobler)
					red_goobler.position = position
				2,3,5:#type:Yellow
					var yellow_goobler = YGOOBLER.instantiate()
					yellow_goobler.set_stat("size",(Global.goobler_base_size + Global.goobler_base_size * size))
					yellow_goobler.set_stat("health",(Global.goobler_base_health + Global.goobler_base_health * size))
					yellow_goobler.set_stat("speed",(yellow_goobler.speed + (yellow_goobler.speed * speed/2)))
					get_parent().add_child(yellow_goobler)
					yellow_goobler.position = position
				7,9:#type:Green
					var green_goobler = GGOOBLER.instantiate()
					green_goobler.set_stat("size",(Global.goobler_base_size + Global.goobler_base_size * size))
					green_goobler.set_stat("health",(Global.goobler_base_health + Global.goobler_base_health * size))
					green_goobler.set_stat("speed",(green_goobler.speed + green_goobler.speed * speed/2))
					get_parent().add_child(green_goobler)
					green_goobler.position = position
				4,6,8,10:#type:Orange
					var orange_goobler = OGOOBLER.instantiate()
					orange_goobler.set_stat("size",(Global.goobler_base_size + Global.goobler_base_size * size))
					orange_goobler.set_stat("health",(Global.goobler_base_health + Global.goobler_base_health * size))
					orange_goobler.set_stat("speed",(orange_goobler.speed + orange_goobler.speed * speed/2))
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
