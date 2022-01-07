extends Panel

func _ready() -> void:
    var node_to_resize = find_node("HBoxContainer2")
    $VBoxContainer/HBoxContainer2/NodeResizer.node_to_resize = node_to_resize
