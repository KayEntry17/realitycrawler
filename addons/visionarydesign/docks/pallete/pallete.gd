extends Control
var dockGrids
@export var dock:PackedScene
@export var bullb:PackedScene
func _ready() -> void:
	dockGrids=[]
	add_docks()
	
func add_docks():
	for i in VisDes.taglist:
		var newdoc=dock.instantiate()
		newdoc.name=i
		$MarginContainer/TabContainer.add_child(newdoc)
		dockGrids.append(newdoc.get_child(0).get_child(0))
	add_buttons()
	add_buttons()
	add_buttons()
	add_buttons()
func add_buttons():
	for i in range(VisDes.bulletList.BulletTextures.size()):
		var newbul=bullb.instantiate()
		newbul.get_child(0).get_child(0).texture=VisDes.bulletList.BulletTextures[i]
		newbul.id=i
		dockGrids[VisDes.bulletList.BulletTags[i]].add_child(newbul)
		newbul.TogglePressed.connect(TogglePressed)
func TogglePressed(id):
	print("bullet "+str(id)+" chosen")
