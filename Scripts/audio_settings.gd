extends MarginContainer
@onready var master_audio_label: Label = $VBoxContainer/MasterAudioLabel
@onready var music_audio_label: Label = $VBoxContainer/MusicAudioLabel
@onready var sfx_audio_label: Label = $VBoxContainer/SfxAudioLabel
var bus_name: String
var bus_index: int
func _ready() -> void:
	var error = Global.SettingsConfig.load("res://Assets/Extra files/SettingsConfig.cfg")
	if error == OK:
		print(Global.SettingsConfig.get_value("settings","master_volume"))
		%MasterAudioSlider.value = Global.SettingsConfig.get_value("settings","master_volume")
		%MusicAudioSlider.value = Global.SettingsConfig.get_value("settings","music_volume")
		%SfxAudioSlider.value = Global.SettingsConfig.get_value("settings","sfx_volume")
		set_volume()
func _on_master_audio_slider_value_changed(value: float) -> void:
	master_audio_label.text="Master: " + str(value * 100) + "%"
	bus_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
func _on_music_audio_slider_value_changed(value: float) -> void:
	music_audio_label.text="Music: " + str(value * 100) + "%"
	bus_index = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
func _on_sfx_audio_slider_value_changed(value: float) -> void:
	sfx_audio_label.text="Sfx: " + str(value * 100) + "%"
	bus_index = AudioServer.get_bus_index("Sfx")
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))

func _on_apply_button_pressed() -> void:
	Global.SettingsConfig.set_value("settings","master_volume",%MasterAudioSlider.value)
	Global.SettingsConfig.set_value("settings","music_volume",%MasterAudioSlider.value)
	Global.SettingsConfig.set_value("settings","sfx_volume",%MasterAudioSlider.value)
	Global.SettingsConfig.save("res://Assets/Extra files/SettingsConfig.cfg")



func set_volume():
	master_audio_label.text="Master: " + str(%MasterAudioSlider.value * 100) + "%"
	bus_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(%MasterAudioSlider.value))
	
	music_audio_label.text="Music: " + str(%MusicAudioSlider.value * 100) + "%"
	bus_index = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(%MusicAudioSlider.value))
	
	sfx_audio_label.text="Sfx: " + str(%SfxAudioSlider.value * 100) + "%"
	bus_index = AudioServer.get_bus_index("Sfx")
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(%SfxAudioSlider.value))
