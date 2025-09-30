extends CanvasLayer


var goobnimations = ["redpedia","orangepedia","bluepedia","yellowpedia","greenpedia"]
var goob_names = ["Roobly","Weeno","Newbler","Spewf","Mitsy"]
var goob_descriptions = ["Roobly is a powerful red goobler with high health", "Weeno is an average orange goobler with no talents","Newbler is a cunning blue goobler with long range attacks","Spewf is a speedy yellow goobler with lower health","Mitsy is a strange green goobler with the ability to split into more gooblers"]
var index = 0
func _process(delta: float) -> void:
	%GooblerName.text = goob_names[index]
	%GooblerSprite.play(goobnimations[index])
	%GooblerDescription.text = goob_descriptions[index]
func _on_left_button_pressed() -> void:
	if index > 0:
		index -= 1
	else:
		index = 4
	print(index)


func _on_right_button_pressed() -> void:
	if index < 4:
		index += 1
	else:
		index = 0
	print(index)


func _on_back_button_pressed() -> void:
	queue_free()
