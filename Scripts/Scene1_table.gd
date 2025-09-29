extends Node2D

const PAUSE = preload("res://Scenes/pause_menu.tscn")
const PIXEL = preload("res://Scenes/pixel.tscn")
const UPGRADE = preload("res://Scenes/upgrade_screen.tscn")
@onready var marker: CharacterBody2D = $Marker
@onready var draw_point: Marker2D = $Marker/DrawPoint
@onready var upgrade_timer_temp: Timer = $UpgradeTimerTemp
@onready var goobler_spawner: Node2D = $GooblerSpawner
@onready var wave_manager_table: Node = $WaveManagerTable
@onready var animations: AnimationPlayer = $Animations
@onready var wave_label: Label = $WaveUi/WaveLabel
func _ready() -> void:
	await animations.animation_finished
	%WaveWaitTimer.start()
	await %WaveWaitTimer.timeout
	wave_manager_table.basic_wave(0,true,[],0,20,5)
	await wave_manager_table.wave_end
	await %WaveWaitTimer.timeout
	wave_manager_table.basic_wave(15,false,[0,1,1],1,0,4)
	await wave_manager_table.wave_end
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		var pause_menu = PAUSE.instantiate()
		add_child(pause_menu)
		Global.paused = true
	if Input.is_action_just_pressed("debug"):
		var upgrade_screen = UPGRADE.instantiate()
		add_child(upgrade_screen)
	if marker.drawing:
		var pixel = PIXEL.instantiate()
		add_child(pixel)
		if Global.ink > 0:
			Global.ink -= Global.ink_cost
		pixel.position = marker.position
	
	
func _on_upgrade_timer_temp_timeout() -> void:
	var upgrade_screen = UPGRADE.instantiate()
	add_child(upgrade_screen)


func _on_wave_manager_table_wave_start() -> void:
	animations.play("WaveStart")


func _on_wave_manager_table_wave_end() -> void:
	animations.play("WaveEnd")
	clear_table()
	%WaveWaitTimer.start()

func clear_table():
	for enemy in get_tree().get_nodes_in_group("enemies"):
		enemy.die()
