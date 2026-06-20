class_name ActionMenuPanel
extends LayoutAnchor

@export var anchor_list: Array[PanelAnchor] = []


func set_position(anchor_name: String, animated: bool):
	var anchor = get_anchor(anchor_name)
	await to_anchor_position(anchor, animated)

	
## Fetches anchor of provided name or `null` if not found.
func get_anchor(anchor_name: String):
	for anchor in self.anchor_list:
		if anchor.anchor_name == anchor_name:
			return anchor
	return null
