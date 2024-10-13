@tool
extends MarginContainer

const BlockCategory = preload("res://addons/block_code/ui/picker/categories/block_category.gd")
const Util = preload("res://addons/block_code/ui/util.gd")

signal selected

var category: BlockCategory
#var gui = EditorInterface.get_base_control()

@onready var _panel := %Panel
@onready var _label := %Label


func _ready():
	if not category:
		category = BlockCategory.new("Example", Color.RED)

	if not Util.node_is_part_of_edited_scene(self):
		var texture = load("res://addons/block_code/ui/picker/categories/category_icons/" + category.icon + ".svg")#Texture2D.new()
		_panel.texture = texture#gui.get_theme_icon(category.icon, "EditorIcons")
		_panel.modulate = category.color

	_label.text = category.name


func _on_button_pressed():
	selected.emit()
