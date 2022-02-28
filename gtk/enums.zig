const c = @import("c.zig");

pub const Orientation = enum(c_int) {
    Horizontal = c.GTK_ORIENTATION_HORIZONTAL,
    Vertical = c.GTK_ORIENTATION_VERTICAL,
};
