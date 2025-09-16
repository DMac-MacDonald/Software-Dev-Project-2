extends CharacterBody2D

var speed = Global.goobler_speed
var goobler_base_health = Global.goobler_base_health
var goobler_health
@onready var goobler_sprite: AnimatedSprite2D = $GooblerSprite
@onready var health_bar: ProgressBar = $GooblerSprite/HealthBar
@onready var hit_area: Area2D = $HitArea


var destination = Global.goobler_destination
var rng = RandomNumberGenerator.new()
var goobler_type
func _ready() -> void:
	
	#var random = int(rng.randf_range(0, 4))
	#goobler_type = random
	match goobler_type:
		0:
			goobler_health = goobler_base_health + (goobler_base_health * .2)
			goobler_sprite.play("BlueDefault")
		1:
			goobler_health = goobler_base_health + (goobler_base_health * 1)
			goobler_sprite.play("RedDefault")
		2:
			goobler_health = goobler_base_health + (goobler_base_health * -.2)
			goobler_sprite.play("YellowDefault")
		3:
			goobler_health = goobler_base_health + (goobler_base_health * .1)
			goobler_sprite.play("GreenDefault")
		4:#Orange 
			goobler_health = goobler_base_health + (goobler_base_health * 0)
			goobler_sprite.play("OrangeDefault")
	health_bar.max_value = goobler_health
func _physics_process(delta: float) -> void:
	
	health_bar.value = goobler_health
	if goobler_health <= 0:
		die()
	
	position += position.direction_to(destination) * speed * delta

func die():
	Global.goobler_die.emit()
	queue_free()
func _on_hit_area_area_entered(area: Area2D) -> void:
	goobler_health -= Global.damage
