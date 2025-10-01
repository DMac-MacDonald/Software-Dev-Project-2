extends Node
@onready var goobler_spawner: Node2D = $"../GooblerSpawner"
var rng = RandomNumberGenerator.new()
@onready var survival_timer: Timer = $SurvivalTimer
@onready var spawn_timer: Timer = $SpawnTimer
signal wave_start
signal wave_end
var enemy_left
#enemy_num defines the amount of enemies desired for the wave as an int
#rand is a bool variable that says whether or not the goobler types are random
#types is an array of goobler types from 0-4 that will spawn
#condition denotes the type of wave
#time is used for survival waves, i.e the length of survival
#freq denotes the frequency of enemies, default is 1
func basic_wave(enemy_num:int, rand:bool, types:Array, condition:int, time:int, freq: int):
	spawn_timer.wait_time = freq
	survival_timer.wait_time = time
	Global.enemy_num = enemy_num
	match condition:
		0:#Walnut:Survival
			Global.wave_num += 1
			Global.wave_type = "walnut"
			survival_timer.start()
			wave_start.emit()
			
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
			wave_end.emit()
			print("Wave Survived")
		1:#Squash:Defeat all
			Global.squash_wave = true
			Global.wave_type = "squash"
			Global.wave_num += 1
			wave_start.emit()
			
			if rand: 
				while Global.enemy_num > 0:
					spawn_timer.start()
					await spawn_timer.timeout
					goobler_spawner.spawn_goobler(rand,0,1)
					goobler_spawner.randomize_pos()
				
								
			else:
				var i = 0
				while Global.enemy_num > 0:
					print("I: " + str(i))
					print(types.size())
					if i >= types.size():
						i=0
					spawn_timer.start()
					await spawn_timer.timeout
					goobler_spawner.spawn_goobler(rand,types[i],1)
					goobler_spawner.randomize_pos()
					++i
			Global.squash_wave = false
			wave_end.emit()
		2:#Dragonfruit:Boss
			pass

func _process(delta: float) -> void:
	Global.wave_time = survival_timer.time_left
func _on_wave_end() -> void:
	Global.fruit_health = Global.fruit_max_health
	Global.ink = Global.max_ink
	
