extends Node
@onready var goobler_spawner: Node2D = $"../GooblerSpawner"
var rng = RandomNumberGenerator.new()
@onready var survival_timer: Timer = $SurvivalTimer
@onready var spawn_timer: Timer = $SpawnTimer

#enemy_num defines the amount of enemies desired for the wave as an int
#rand is a bool variable that says whether or not the goobler types are random
#types is an array of goobler types from 0-4 that will spawn
#condition denotes the type of wave
#time is used for survival waves, i.e the length of survival
#freq denotes the frequency of enemies, default is 1
func basic_wave(enemy_num:int, rand:bool, types:Array, condition:int, time:int, freq: int):
	spawn_timer.wait_time = freq
	survival_timer.wait_time = time
	match condition:
		0:#Walnut:Survival
			survival_timer.start()
			if rand:
				while survival_timer.time_left > 0:
					spawn_timer.start()
					await spawn_timer.timeout
					goobler_spawner.spawn_goobler(rand,0,1)
					goobler_spawner.randomize_pos()
			else:
				var i = 0
				while survival_timer.time_left > 0:
					if i > types.size():
						i=0
					spawn_timer.start()
					await spawn_timer.timeout
					goobler_spawner.spawn_goobler(rand,types[0],1)
					goobler_spawner.randomize_pos()
					++i
			print("you won!")
		1:#Squash:Defeat all
			pass
		2:#Dragonfruit:Boss
			pass

#func _on_spawn_timer_temp_timeout() -> void:
#	var random = rng.randf_range(0,4)
#	goobler_spawner.randomize_pos()
#	goobler_spawner.spawn_goobler(random)
