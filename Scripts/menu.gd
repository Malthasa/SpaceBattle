extends Control


func _ready():
	var highlighter = create_gdscript_highlighter()
	# configure your keywords, colors, etc.
	
	$BoxContainer/HBoxContainer/P1.syntax_highlighter = highlighter
	$BoxContainer/HBoxContainer/P2.syntax_highlighter = highlighter


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("debug"):
		$BoxContainer/HBoxContainer/P1.text = globaldata.p1script
		$BoxContainer/HBoxContainer/P2.text = globaldata.p2script

func create_gdscript_highlighter() -> CodeHighlighter:
	var h = CodeHighlighter.new()
	
# Keywords (orange)
	var keyword_color = Color("ff7085")
	for kw in ["if", "elif", "else", "for", "while", "match", "break", "continue",
			   "pass", "return", "class", "class_name", "extends", "is", "in",
			   "not", "and", "or", "as", "self", "signal", "func", "static",
			   "const", "var", "enum", "breakpoint", "preload", "load",
			   "await", "yield", "assert", "true", "false", "null", "PI", "TAU", "INF", "NAN"]:
		h.add_keyword_color(kw, keyword_color)

# Built-in types (blue)
	var type_color = Color("42ffc2")
	for t in ["int", "float", "bool", "String", "StringName", "Vector2", "Vector2i",
		  "Vector3", "Vector3i", "Vector4", "Vector4i", "Color", "Rect2", "Rect2i",
		  "Transform2D", "Transform3D", "Basis", "Quaternion", "Plane", "AABB",
		  "NodePath", "RID", "Object", "Array", "Dictionary", "Callable", "Signal",
		  "PackedByteArray", "PackedInt32Array", "PackedInt64Array",
		  "PackedFloat32Array", "PackedFloat64Array", "PackedStringArray",
		  "PackedVector2Array", "PackedVector3Array", "PackedColorArray", "Variant"]:
		h.add_keyword_color(t, type_color)

	# Comments
	h.add_color_region("#", "", Color("cdcfd280"), true)
	
	# Strings
	h.add_color_region("\"", "\"", Color("ffeda1"))
	h.add_color_region("'", "'", Color("ffeda1"))
	
	# Multiline strings
	h.add_color_region("\"\"\"", "\"\"\"", Color("ffeda1"))
	h.add_color_region("'''", "'''", Color("ffeda1"))
	
	# Node paths ($)
	h.add_color_region("$\"", "\"", Color("f4a15d"))
	h.add_color_region("$'", "'", Color("f4a15d"))

	# Annotations (@)
	h.add_keyword_color("@export", Color("ff7085"))
	h.add_keyword_color("@export_range", Color("ff7085"))
	h.add_keyword_color("@export_enum", Color("ff7085"))
	h.add_keyword_color("@export_group", Color("ff7085"))
	h.add_keyword_color("@export_subgroup", Color("ff7085"))
	h.add_keyword_color("@onready", Color("ff7085"))
	h.add_keyword_color("@tool", Color("ff7085"))
	h.add_keyword_color("@static_var", Color("ff7085"))
	h.add_keyword_color("@warning_ignore", Color("ff7085"))

	# Member variables color (for . access — not directly supported, but set the base)
	h.member_variable_color = Color("57b3ff")

	# Number color
	h.number_color = Color("a1ffe4")

	# Function color
	h.function_color = Color("57b3ff")

	# Symbol color
	h.symbol_color = Color("abc9ff")

	return h


func _on_start_pressed() -> void:
	globaldata.p1script = $BoxContainer/HBoxContainer/P1.text
	globaldata.p2script = $BoxContainer/HBoxContainer/P2.text
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
