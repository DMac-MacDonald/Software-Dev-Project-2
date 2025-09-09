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
	

func _on_area_entered(area: Area2D) -> void:
	animation_player.play("die")
