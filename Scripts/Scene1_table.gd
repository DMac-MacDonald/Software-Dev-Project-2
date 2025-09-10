extends Node2D

const PIXEL = preload("res://Scenes/pixel.tscn")
const UPGRADE = preload("res://Scenes/upgrade_screen.tscn")
@onready var marker: CharacterBody2D = $Marker
@onready var draw_point: Marker2D = $Marker/DrawPoint
@onready var upgrade_timer_temp: Timer = $UpgradeTimerTemp
@onready var goobler_spawner: Node2D = $GooblerSpawner
@onready var wave_manager_table: Node = $WaveManagerTable

func _ready() -> void:
	wave_manager_table.basic_wave(0,true,[],0,30,1)
func _process(delta: float) -> void:
	if marker.drawing:
		var pixel = PIXEL.instantiate()
		add_child(pixel)
		if Global.ink > 0:
			Global.ink -= Global.ink_cost
		pixel.position = marker.position
	
	
func _on_upgrade_timer_temp_timeout() -> void:
	var upgrade_screen = UPGRADE.instantiate()
	add_child(upgrade_screen)
