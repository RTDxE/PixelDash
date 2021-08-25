extends TextureButton


func _on_musicToggle_toggled(button_pressed: bool) -> void:
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), button_pressed)
	if button_pressed:
		$"../music".stop()
	else:
		$"../music".play()
