extends MarginContainer

@onready var upgrade_description: Label = $PanelContainer/VBoxContainer/UpgradeDescription
@onready var upgrade_picture: TextureRect = $PanelContainer/VBoxContainer/UpgradePicture
@onready var upgrade_name: Label = $PanelContainer/VBoxContainer/UpgradeName

var descriptions = []
var names = []
var rng = RandomNumberGenerator.new()
var randomNum
func _ready() -> void:
	load_descriptions()
	load_names()
	var random = int(rng.randf_range(0, descriptions.size()-1))
	randomNum = random
	upgrade_description.text = descriptions[random]
	upgrade_name.text = names[random]
	match random:
		0:#++width
			upgrade_picture.texture = preload("res://Assets/Sprites/Line_Width_Up1.png")
		1:#++damage
			upgrade_picture.texture = preload("res://Assets/Sprites/Damage_Up1.png")
		2:#--enemy health
			upgrade_picture.texture = preload("res://Assets/Sprites/Goobler_Health_Down1.png")
		3:#++fruit health
			upgrade_picture.texture = preload("res://Assets/Sprites/fruit_health_Up11.png")
		4:#++ink charge
			upgrade_picture.texture = preload("res://Assets/Sprites/Ink_Charge_Up1.png")
		5:#--ink cost
			upgrade_picture.texture = preload("res://Assets/Sprites/Ink_Cost_Down1.png")
		6:#++Max Ink
			upgrade_picture.texture = preload("res://Assets/Sprites/max_ink_Up11.png")
		7:
			upgrade_picture.texture = preload("res://Assets/Sprites/marker_speed_Up11.png")
		8:
			upgrade_picture.texture = preload("res://Assets/Sprites/Ink_cooldown_Down11.png")
		9:
			upgrade_picture.texture = preload("res://Assets/Sprites/goobler_speed_Down11.png")
		10:
			upgrade_picture.texture = preload("res://Assets/Sprites/goobler_damage_Down11.png")
		
func _on_upgrade_button_pressed() -> void:
	
	match randomNum:
		0:#++width
			Global.width += (Global.width * .2)
			print(Global.width)
		1:#++damage
			Global.damage += (Global.damage *.05)
			print(Global.damage)
		2:#--enemy health
			Global.goobler_base_health -= (Global.goobler_base_health *.05)
			print(Global.goobler_base_health)
		3:#++fruit health
			Global.fruit_max_health += 10
			print(Global.fruit_max_health)
		4:#++ink charge
			Global.ink_regen += (Global.ink_regen * .2)
			print(Global.ink_regen)
		5:#--ink cost
			Global.ink_cost -= (Global.ink_regen * .2)
			print(Global.ink_cost)
		6:#++ink
			Global.max_ink += 10
			print(Global.max_ink)
		7:#++Marker Speed
			Global.marker_speed += (Global.marker_speed * .1)
			print(Global.marker_speed)
		8:#--Ink Cooldown
			Global.ink_cooldown -= (Global.ink_cooldown * .1)
			print(Global.ink_cooldown)
		9:#--Goobler Speed
			Global.goobler_speed += (Global.goobler_speed * .2)
			print(Global.goobler_speed)
		10:#--Goobler Damage
			Global.goobler_damage -= (Global.goobler_damage *.1)
			print(Global.goobler_damage)
	Global.upgrade_chosen = true
	

func load_descriptions():
	var file = FileAccess.open("res://Assets/Extra files/descriptions.txt", FileAccess.READ)
	while not file.eof_reached(): # iterate through all lines until the end of file is reached
		var line = file.get_line()
		descriptions.append(line)

func load_names():
	var file = FileAccess.open("res://Assets/Extra files/names.txt", FileAccess.READ)
	while not file.eof_reached(): # iterate through all lines until the end of file is reached
		var line = file.get_line()
		names.append(line)
