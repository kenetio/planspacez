extends TextureButton

var tru = true

func _on_pressed() -> void:
	if tru == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		ProjectSettings.set("display/window/size/viewport_width", 1680)
		ProjectSettings.set("display/window/size/viewport_height", 900)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		ProjectSettings.set("display/window/size/viewport_width", 1920)
		ProjectSettings.set("display/window/size/viewport_height", 1080)
