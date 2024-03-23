class_name WorkshopLockedControl
extends SceneTreeCustomColumn

const LOCK_ICON:Texture = preload("res://ui/icons/workshop-assets/buttons/default/Lock.png")

func draw(scene_tree_control:Control, rect:Rect2, item:TreeItem, node:Node)->void :
	var scope = Profiler.scope(self, "draw", [scene_tree_control, rect, item, node])

	WorkshopSceneTreeCustomControl.draw_background(scene_tree_control, rect, item)

	if not "locked" in node:
		return 

	var modulate:Color
	if node.locked:
		modulate = Color.white
	else :
		modulate = Color(1, 1, 1, 0.25)

	WorkshopSceneTreeCustomControl.draw_texture_centered(scene_tree_control, LOCK_ICON, rect, modulate)

func input(scene_tree_control:Control, event:InputEvent, item:TreeItem, node:Node)->void :
	var scope = Profiler.scope(self, "input", [scene_tree_control, event, item, node])

	if not "locked" in node:
		return 

	if event is InputEventMouseButton:
		if event.pressed:
			if event.button_index == BUTTON_LEFT:
				AssignProperty.new(node, "locked", not node.locked).execute()
