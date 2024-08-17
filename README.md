# Resonite Assets

Contains source material for my Resonite assets.

## Modeling Notes

To avoid issues with strange rotations or scaling, meshes should be exported to
make them usable in Resonite with `[0, 0, 0]` offset, `[0, 0, 0]` rotation, and
`[1, 1, 1]` scale:

- Resonite imports STL outputs at a 90-degree angle compared to what OpenSCAD
  exports; to avoid needing to rotate the model in Resonite, rotate the model
  by `[-90, 0, 0]` in OpenSCAD before exporting.
- By default, Resonite treats 1 unit of length as equal to 1 metre; it's likely
  grabbable objects will need to be scaled down to a smaller size.
- Try to keep geometry centred around the zero-point to avoid needing to
  manually position the object in Resonite.

## Asset Creation Notes

- Add a Transform > `ObjectRoot` component to the top-most object in the item's
  hierarchy for easier inspector navigation.
- Export icons as 256x256 PNGs, and attach them to the root object as an
  owned `StaticTexture2D` component.

  Add the icon as a thumbnail with a Uncategorized >
  `ItemTextureThumbnailSource` component on the root object.
- Add a child object named `by Lixquid` to the root object.

  All used assets should be owned by assets in this object to make it easier to
  track what assets are used in the item (unless there's a more appropriate
  object to own the assets).
