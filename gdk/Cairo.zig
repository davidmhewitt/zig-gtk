const Cairo = @import("../cairo.zig");
const Gdk = @import("../gdk.zig");

extern fn gdk_cairo_set_source_pixbuf(context: *Cairo.Context, pixbuf: *Gdk.Pixbuf, x: f64, y: f64) void;
pub const setSourcePixbuf = gdk_cairo_set_source_pixbuf;
