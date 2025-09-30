extends CanvasLayer


const OPTIONS = preload("res://Scenes/options_menu.tscn")
const GOOB = preload("res://Scenes/gooblerpedia.tscn")
func _on_resume_button_pressed() -> void:
	Global.paused = false
	queue_free()


func _on_options_button_pressed() -> void:
	if get_child_count() == 2:
		var options_menu = OPTIONS.instantiate()
		add_child(options_menu)
		


func _on_quit_button_pressed() -> void:
	Global.paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_gooblerpedia_button_pressed() -> void:
	if get_child_count() == 2:
		var gooblerpedia = GOOB.instantiate()
		add_child(gooblerpedia)
