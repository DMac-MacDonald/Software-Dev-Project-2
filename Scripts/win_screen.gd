extends MarginContainer

func _ready() -> void:
	%AnimationPlayer.play("win_animation")
	await %AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
