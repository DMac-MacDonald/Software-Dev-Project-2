extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -400.0

@onready var monster_sprite: AnimatedSprite2D = $MonsterSprite


var destination = Global.monster_destination
var rng = RandomNumberGenerator.new()
func _ready() -> void:
	var random = int(rng.randf_range(0, 4))
	match random:
		0:
			monster_sprite.play("BlueDefault")
		1:
			monster_sprite.play("RedDefault")
		2:
			monster_sprite.play("YellowDefault")
		3:
			monster_sprite.play("GreenDefault")
		4:
			monster_sprite.play("OrangeDefault")
func _physics_process(delta: float) -> void:
	position += position.direction_to(destination) * SPEED * delta
