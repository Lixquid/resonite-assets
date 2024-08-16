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
