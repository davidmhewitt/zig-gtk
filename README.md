# zig-gtk

Thin Zig wrapper for [GTK 4](https://gitlab.gnome.org/GNOME/gtk).

🚧 Very much a work in progress... 🚧

## Naming convention

Type names and method names of the original C library were changed to follow the [Zig Style Guide](https://ziglang.org/documentation/0.9.1/#Names). For example, a method like `gtk_grid_view_set_single_click_activate(grid_view, single_click_activate)` in GTK C becomes a method belonging to the `GridView` struct and can be called like `grid_view.setSingleClickActivate(single_click_activate)` in zig-gtk.

## Status

This is currently very incomplete. Only a small number of types have been wrapped, and those that have aren't fully wrapped. I have only been binding the types and methods I need in my projects for now.

PRs are very welcome to add more bindings.

## Usage

zig-gtk depends on [zig-glib](https://github.com/davidmhewitt/zig-glib/), so add this module too. Then add the following to your `build.zig`:

```
const glib = std.build.Pkg{ .name = "glib", .path = .{ .path = "deps/zig-glib/glib.zig" } };
const gtk = std.build.Pkg{
    .name = "gtk",
    .path = .{ .path = "deps/zig-gtk/gtk.zig" },
    .dependencies = &[_]std.build.Pkg{glib},
};

exe.addPackage(glib);
exe.addPackage(gtk);

exe.linkSystemLibrary("gtk4");
```