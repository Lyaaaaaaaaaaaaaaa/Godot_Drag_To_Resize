# Godot_Drag_To_Resize
A plugin to easily resize ui elements

## Features
- Resize on the horizontal axis

![](https://github.com/Lyaaaaaaaaaaaaaaa/Godot_Drag_To_Resize/blob/Master/images/hresize.gif)

- Resize on the vertical axis

![](https://github.com/Lyaaaaaaaaaaaaaaa/Godot_Drag_To_Resize/blob/Master/images/vresize.gif)

- Resize on both axis

![](https://github.com/Lyaaaaaaaaaaaaaaa/Godot_Drag_To_Resize/blob/Master/images/bresize.gif)

- Specify a maximum or minimal limit

![](https://github.com/Lyaaaaaaaaaaaaaaa/Godot_Drag_To_Resize/blob/Master/images/min_max.png)

## How to use

1. Download the latest release
2. Extract
3. Copy the `addons/drag_to_resize` folder into your project's addons folder.
4. In your project settings, enable the `DragtoResize` plugin.
5. Add the NodeResizer to your scene and set it up
  1. Set the `NodeResizer.node_to_resize` to the node you want to resize. **You need a script to do this. See the `example.gd`**
  2. Specify the maximum and minimum size allowed (Setting them to 0 disable the limits)
  3. Specify in which axes is the node allowed to grow
6. `NodeResizer` is a `TextureButton`, give it the icon you want.

## Need help?

Check the example.tscn scene.

## More information:

[Code of conduct](https://github.com/Lyaaaaaaaaaaaaaaa/Godot_Drag_To_Resize/blob/master/CODE_OF_CONDUCT.md)

[How to contribute](https://github.com/Lyaaaaaaaaaaaaaaa/Godot_Drag_To_Resize/blob/master/CONTRIBUTING.md)
