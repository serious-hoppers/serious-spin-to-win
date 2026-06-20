class_name ActionMenuPanelController
extends Node

const INT32_MAX = 2147483647

const SHOW_KEY: String = "Show"
const HIDE_KEY: String = "Hide"
const ENTRY_POOL_KEY: String = "ActionMenuPanel.Entry"
const MENU_COUNT: int = 4

@export var entry_prefab: PackedScene
@export var title_label: Label
@export var panel: ActionMenuPanel
@export var entry_vbox: VBoxContainer

var menu_entries: Array[ActionMenuEntry] = []
var selection: int


func _ready():
	%PoolController.add_entry(ENTRY_POOL_KEY, entry_prefab, MENU_COUNT, INT32_MAX)
	panel.set_position(HIDE_KEY, false)
	_disable_node(panel)
	

func _enable_node(node: Node) -> void:
	node.process_mode = Node.PROCESS_MODE_INHERIT
	node.show()
	
	
func _disable_node(node: Node) -> void:
	node.process_mode = Node.PROCESS_MODE_DISABLED
	node.hide()


func show(title: String, options: Array[String]) -> void:
	_enable_node(panel)
	clear()
	title_label.text = tr(title)
	
	for option in options:
		var entry: ActionMenuEntry = dequeue()
		entry.title = tr(option)
		menu_entries.append(entry)
		
	set_selection(0)
	await panel.set_position(SHOW_KEY, true)
	
	
func hide() -> void:
	await panel.set_position(HIDE_KEY, true)
	clear()
	
	# shrink panel to the correct size
	panel.size = Vector2.ZERO
	panel.set_position(HIDE_KEY, false)
	

func next():
	if menu_entries.size() == 0:
		return	
	for i in range(selection+1, menu_entries.size()+2):
		var index: int = i % menu_entries.size()
		if set_selection(index):
			break


func previous():
	if menu_entries.size() == 0:
		return
	for i in range(selection - 1 + menu_entries.size(), selection, -1):
		var index: int = i % menu_entries.size()
		if set_selection(index):
			break
			
			
func clear():
	for i in range(menu_entries.size()-1, -1, -1):
		enqueue(menu_entries[i])
	menu_entries.clear()
			
			
func set_selection(value: int) -> bool:
	if menu_entries[value].is_locked:
		return false
		
	# Deselect the previously selected entry
	if selection >= 0 and selection < menu_entries.size():
		menu_entries[selection].is_selected = false
		
	selection = value
	
	# Select the new entry
	if selection >= 0 and selection < menu_entries.size():
		menu_entries[selection].is_selected = true
		
	return true
	
	
func enqueue(entry: ActionMenuEntry):
	var p: Poolable = entry.get_parent()
	%PoolController.enqueue(p)


func dequeue() -> ActionMenuEntry:
	var p: Poolable = %PoolController.dequeue(ENTRY_POOL_KEY)
	var entry: ActionMenuEntry = p.get_node("Entry")
	
	if p.get_parent():
		p.get_parent().remove_child(p)
	entry_vbox.add_child(p)
	_enable_node(p)
	entry.reset()
	return entry
