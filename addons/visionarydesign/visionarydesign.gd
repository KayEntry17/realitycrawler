@tool
extends EditorPlugin
var dockpallete
var docktimeline
# Replace this value with a PascalCase autoload name, as per the GDScript style guide.
const AUTOLOAD_NAME = "VisDes"


func _enable_plugin():
	# The autoload can be a scene or script file.
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/visionarydesign/core.tscn")


func _disable_plugin():
	remove_autoload_singleton(AUTOLOAD_NAME)
func _enter_tree() -> void:
	await get_tree().create_timer(1.0).timeout
	dockpallete=preload("res://addons/visionarydesign/docks/pallete/pallete.tscn").instantiate()
	#docktimeline = preload().instantiate()
	add_control_to_dock(DOCK_SLOT_RIGHT_BL, dockpallete)
	#add_control_to_bottom_panel(docktimeline, "Timeline")
	
	


func _exit_tree() -> void:
	#remove_control_from_bottom_panel(docktimeline)
	remove_control_from_docks(dockpallete)
	#docktimeline.free()
	dockpallete.free()
	
