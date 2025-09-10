extends CanvasLayer

@onready var ink_meter: ProgressBar = $Control/MarginContainer/VBoxContainer/InkMeter
@onready var animation_player: AnimationPlayer = $Control/MarginContainer/VBoxContainer/InkMeter/AnimationPlayer
@onready var charge_timer: Timer = $Control/MarginContainer/VBoxContainer/InkMeter/AnimationPlayer/ChargeTimer
@onready var fruit_health_bar: ProgressBar = $Control/MarginContainer/VBoxContainer/FruitHealthBar
@onready var fruit_health_label: Label = $Control/MarginContainer/VBoxContainer/FruitHealthBar/FruitHealthLabel
@onready var ink_label: Label = $Control/MarginContainer/VBoxContainer/InkMeter/InkLabel
@onready var wave_animations: AnimationPlayer = $WaveAnimations

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ink_meter.value = 100.0
	fruit_health_bar.value = 100.0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Global.ink <= 0:
		animation_player.play("InkEmpty")
	ink_meter.max_value = Global.max_ink
	if Global.ink < Global.max_ink:
		ink_meter.value = Global.ink
		ink_label.text = "  Ink:" + str(int(Global.ink))
	else:
		Global.ink = Global.max_ink
		ink_meter.value = Global.ink
		ink_label.text = "  Ink:" + str(int(Global.ink))
	
	Global.wave_start.connect(wave_start_anim)
	
	fruit_health_bar.max_value = Global.fruit_max_health
	if Global.fruit_health < Global.fruit_max_health:
		fruit_health_bar.value = Global.fruit_health
		fruit_health_label.text = "  Fruit Health:" + str(int(Global.fruit_health))
	else:
		Global.fruit_health = Global.fruit_max_health
		fruit_health_bar.value = Global.fruit_health
		fruit_health_label.text = "  Fruit Health:" + str(int(Global.fruit_health))
	
	
func _on_charge_timer_timeout() -> void:
	charge_timer.autostart = false
	Global.charging = true

func set_charge (val: bool):
	if Global.charging != val:
		Global.charging = val

func wave_start_anim():
	print("wave start animation")
	wave_animations.play("WaveStart")
