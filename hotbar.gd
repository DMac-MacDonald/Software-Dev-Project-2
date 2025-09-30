extends MarginContainer

func _process(delta: float) -> void:
	match Global.current_pix_color:
		"default":
			%HotbarSquare1.color = "white"
			%HotbarSquare2.color = "black"
			%HotbarSquare3.color = "black"
			%HotbarSquare4.color = "black"
			%HotbarSquare5.color = "black"
			%HotbarSquare6.color = "black"
		"red":
			%HotbarSquare1.color = "black"
			%HotbarSquare2.color = "white"
			%HotbarSquare3.color = "black"
			%HotbarSquare4.color = "black"
			%HotbarSquare5.color = "black"
			%HotbarSquare6.color = "black"
		"blue":
			%HotbarSquare1.color = "black"
			%HotbarSquare2.color = "black"
			%HotbarSquare3.color = "white"
			%HotbarSquare4.color = "black"
			%HotbarSquare5.color = "black"
			%HotbarSquare6.color = "black"
		"green":
			%HotbarSquare1.color = "black"
			%HotbarSquare2.color = "black"
			%HotbarSquare3.color = "black"
			%HotbarSquare4.color = "white"
			%HotbarSquare5.color = "black"
			%HotbarSquare6.color = "black"
		"yellow":
			%HotbarSquare1.color = "black"
			%HotbarSquare2.color = "black"
			%HotbarSquare3.color = "black"
			%HotbarSquare4.color = "black"
			%HotbarSquare5.color = "white"
			%HotbarSquare6.color = "black"
		"brown":
			%HotbarSquare1.color = "black"
			%HotbarSquare2.color = "black"
			%HotbarSquare3.color = "black"
			%HotbarSquare4.color = "black"
			%HotbarSquare5.color = "black"
			%HotbarSquare6.color = "white"
