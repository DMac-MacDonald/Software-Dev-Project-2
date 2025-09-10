extends Node

var ink = 100.0
var charging: bool = true
var paused: bool = false
var upgrade_chosen = false
var ink_cost = .7
var ink_regen = .23
var max_ink = 100
var damage = 5
var fruit_max_health = 100
var fruit_health = 100
var width = .5
var goobler_destination = Vector2(1349.0,1191.0)
var goobler_base_health = 100
var goobler_speed = 180
signal wave_end
signal wave_start
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ink < max_ink and charging:
		ink += ink_regen
	if paused:
		get_tree().paused = true
	else:
		get_tree().paused = false


func _on_wave_start() -> void:
	print("wave start signal")
