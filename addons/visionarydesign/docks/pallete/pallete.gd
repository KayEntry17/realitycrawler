extends Control
var dockGrids
@export var dock:PackedScene
@export var bullb:PackedScene
var buttonlist=[]

func _ready() -> void:
	dockGrids=[]
	add_docks()
	
func add_docks():
	for i in $MarginContainer/TabContainer.get_children():
		i.queue_free()
	for i in VisDes.taglist:
		var newdoc=dock.instantiate()
		newdoc.name=i
		$MarginContainer/TabContainer.add_child(newdoc)
		dockGrids.append(newdoc.get_child(0).get_child(0))
	add_buttons()
	
func add_buttons():
	for i in range(VisDes.bulletList.BulletTextures.size()):
		var newbul=bullb.instantiate()
		newbul.get_child(0).get_child(0).texture=VisDes.bulletList.BulletTextures[i]
		newbul.id=i
		dockGrids[VisDes.bulletList.BulletTags[i]].add_child(newbul)
		newbul.TogglePressed.connect(TogglePressed)
		buttonlist.append(newbul)
func TogglePressed(id):
	if VisDes.currentbullet==-1:
		VisDes.currentbullet=id
	elif VisDes.currentbullet==id:
		VisDes.currentbullet=-1
	else:
		buttonlist[VisDes.currentbullet].button_pressed=false
		VisDes.currentbullet=id
	print(VisDes.currentbullet)
