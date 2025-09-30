extends Node

func _ready() -> void:
	Global.paused = true
	%Animations.play("Loading")
	await %Animations.animation_finished
	Global.paused = false
