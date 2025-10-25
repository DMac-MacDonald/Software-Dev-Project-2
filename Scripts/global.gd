extends Node

var ink = 100.0
var charging: bool = true
var paused: bool = false
var upgrade_chosen = false
@export var ink_cost = 1
@export var ink_regen = .23
@export var ink_cooldown = 2.5
@export var max_ink = 100
@export var damage = 5
@export var fruit_max_health = 100
@export var fruit_health = 100
@export var width = .5
@export var goobler_destination = Vector2(1349.0,1191.0)
@export var goobler_base_size = 1
@export var goobler_base_health = 100
@export var goobler_speed = 120
@export var goobler_damage = 20
@export var current_pix_color = "default"
@export var wave_num = 0
@export var wave_type = "walnut"
@export var marker_speed = 300
var wave_time: int
var enemy_num = 0
var squash_wave: bool
var SettingsConfig = ConfigFile.new()
signal goobler_die
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

func _on_goobler_die() -> void:
	if squash_wave:
		enemy_num -= 1
