#------------------------------------------------------------------------------
#-- Copyright (c) 2022 Lyaaaaaaaaaaaaaaa (MIT)
#--
#-- Author : Lyaaaaaaaaaaaaaaa
#--
#-- Implementation Notes:
#--  - 
#--
#-- Anticipated changes:
#--  - 
#--
#-- Changelog:
#--  - 07/01/2022 Lyaaaaa
#--    - Created the file
#--    - Removed node_path_to_resize and renamed node in node_to_resize.
#--    - node_to_resize is now of type Node.
#--    - Updated _ready function to set a default tooltip if none is defined.
#--    - growing_axe has now Growing_Axes.BOTH as default value.
#------------------------------------------------------------------------------
extends TextureButton

enum Growing_Axes {VERTICAL   = 0,
                   HORIZONTAL = 1,
                   BOTH       = 2}

export(Vector2) var max_size : Vector2
export(Vector2) var min_size : Vector2
export(int, "Vertical", "Horizontal", "Both") var growing_axe : int = Growing_Axes.BOTH

var node_to_resize : Node

var _previous_position : Vector2


func _ready() -> void:
    _connect_signals()
    set_process(false)
    
    if hint_tooltip.empty():
        set_tooltip("Hold left click to resize")
    if   growing_axe == Growing_Axes.VERTICAL:
        set_default_cursor_shape(Control.CURSOR_VSIZE)
        
    elif growing_axe == Growing_Axes.HORIZONTAL:
        set_default_cursor_shape(Control.CURSOR_HSIZE)
        
    elif growing_axe == Growing_Axes.BOTH:
        set_default_cursor_shape(Control.CURSOR_MOVE)


func _process(_delta) -> void:
    var mouse_position = get_global_mouse_position()
    
    if   growing_axe == Growing_Axes.VERTICAL:
        _resize_vertical(mouse_position.y, _previous_position.y)
        
    elif growing_axe == Growing_Axes.HORIZONTAL:
        _resize_horizontal(mouse_position.x, _previous_position.x)
        
    elif growing_axe == Growing_Axes.BOTH:
        _resize_both(mouse_position, _previous_position)
    
    _previous_position = mouse_position
    

func _resize_vertical(p_mouse_position_y    : int,
                      p_previous_position_y : int) -> void:
    var difference : int
    difference = p_previous_position_y - p_mouse_position_y
    if node_to_resize.rect_min_size.y + difference < min_size.y and min_size.y != 0:
        node_to_resize.rect_min_size.y = min_size.y
    elif node_to_resize.rect_min_size.y + difference > max_size.y and max_size.y != 0:
        node_to_resize.rect_min_size.y = max_size.y
    else:
        node_to_resize.rect_min_size.y += difference
        
    
func _resize_horizontal(p_mouse_position_x    : int,
                        p_previous_position_x : int) -> void:
    var difference : int
    difference = p_mouse_position_x - p_previous_position_x
    if node_to_resize.rect_min_size.x + difference < min_size.x and min_size.x != 0:
        node_to_resize.rect_min_size.x = min_size.x
    elif node_to_resize.rect_min_size.x + difference > max_size.x and max_size.x != 0:
        node_to_resize.rect_min_size.x = max_size.x
    else:
        node_to_resize.rect_min_size.x += difference

    
func _resize_both(p_mouse_position    : Vector2,
                  p_previous_position : Vector2) -> void:
    _resize_horizontal(p_mouse_position.x, p_previous_position.x)
    _resize_vertical(p_mouse_position.y, p_previous_position.y)


func _connect_signals() -> void:
    connect("button_down", self, "_on_Resizer_button_down")
    connect("button_up",   self, "_on_Resizer_button_up")
    

func _on_Resizer_button_down() -> void:
    _previous_position = get_global_mouse_position()
    set_process(true)


func _on_Resizer_button_up() -> void:
    set_process(false)
