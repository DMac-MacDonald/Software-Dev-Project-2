extends Area2D
@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_timer_timeout() -> void:
	queue_free()

func _process(delta: float) -> void:
	scale.x=Global.width
	scale.y=Global.width

func die():
	queue_free()

func set_color(value: String):
	match value:
		"no":
			%AnimatedSprite2D.play("no_pix")
		"default":
			%AnimatedSprite2D.play("default_pix")
		"blue":
			%AnimatedSprite2D.play("blue_pix")
		"red":
			%AnimatedSprite2D.play("red_pix")
		"yellow":
			%AnimatedSprite2D.play("yellow_pix")
		"green":
			%AnimatedSprite2D.play("green_pix")
		"brown":
			%AnimatedSprite2D.play("brown_pix")

func _on_area_entered(area: Area2D) -> void:
	animation_player.play("die")
