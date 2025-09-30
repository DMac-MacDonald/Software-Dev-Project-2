extends CharacterBody2D

@onready var goobler_sprite: AnimatedSprite2D = $GooblerSprite
@onready var health_bar: ProgressBar = $GooblerSprite/HealthBar
@onready var hit_area: Area2D = $HitArea
var speed = Global.goobler_speed
var goobler_health = Global.goobler_base_health + (Global.goobler_base_health * .1)
var destination = Global.goobler_destination
func _ready() -> void:
	health_bar.max_value = goobler_health
	
func _process(delta: float) -> void:
	health_bar.value = goobler_health
	position += position.direction_to(destination) * speed * delta
	if goobler_health <= 0:
		die()
func die():
	Global.goobler_die.emit()
	queue_free()
func _on_hit_area_area_entered(area: Area2D) -> void:
	match area.indv_color:
		"default":
			goobler_health -= Global.damage
		"blue":
			goobler_health -= (Global.damage + (Global.damage * -.1))
		"red":
			goobler_health -= (Global.damage + (Global.damage * -.1))
		"yellow":
			goobler_health -= (Global.damage + (Global.damage * -.1))
		"green":
			goobler_health -= (Global.damage + (Global.damage * .5))
		"brown":
			goobler_health -= (Global.damage + (Global.damage * -.3))
	
