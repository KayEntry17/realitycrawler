extends TextureButton
var id
signal TogglePressed(idb)


func _on_pressed() -> void:
	TogglePressed.emit(id)
		
