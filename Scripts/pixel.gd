extends Area2D
@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var indv_color = "default"
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
			indv_color = "default"
		"blue":
			%AnimatedSprite2D.play("blue_pix")
			indv_color = "blue"
		"red":
			%AnimatedSprite2D.play("red_pix")
			indv_color = "red"
		"yellow":
			%AnimatedSprite2D.play("yellow_pix")
			indv_color = "yellow"
		"green":
			%AnimatedSprite2D.play("green_pix")
			indv_color = "green"
		"brown":
			%AnimatedSprite2D.play("brown_pix")
			indv_color = "brown"

func _on_area_entered(area: Area2D) -> void:
	animation_player.play("die")
