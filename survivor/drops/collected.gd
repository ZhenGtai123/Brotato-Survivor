extends AudioStreamPlayer2D

var is_playing_sound = false

func custom_play():
	if not is_playing_sound:
		play()
	is_playing_sound = true
	print(is_playing_sound)
	await get_tree().create_timer(1).timeout
	is_playing_sound = false
		
