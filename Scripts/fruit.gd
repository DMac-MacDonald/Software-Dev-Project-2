extends Area2D

func _process(delta: float) -> void:
	if Global.fruit_health <= 0:
		print("oh fugggg, you died mannnn")
		queue_free()
	if Input.is_action_just_pressed("debug"):
		Global.fruit_health = int(Global.fruit_max_health)

func _on_area_entered(area: Area2D) -> void:
	Global.fruit_health -= 20
	
