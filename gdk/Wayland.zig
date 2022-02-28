const wayland = @import("wayland");
const wl = wayland.client.wl;

pub const Display = extern struct {
    const Self = @This();
    parent_instance: *anyopaque,

    extern fn gdk_wayland_display_get_wl_display(self: *Self) ?*wl.Display;
    pub const getWlDisplay = gdk_wayland_display_get_wl_display;
};
