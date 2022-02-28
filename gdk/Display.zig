const Gdk = @import("../gdk.zig");

pub const Display = extern struct {
    const Self = @This();
    parent_instance: *anyopaque,

    extern fn gdk_display_get_default() ?*Self;
    pub const getDefault = gdk_display_get_default;

    pub fn asWaylandDisplay(self: *Self) *Gdk.Wayland.Display {
        return @ptrCast(*Gdk.Wayland.Display, self);
    }
};
