const Gtk = @import("../gtk.zig");

pub const Widget = extern struct {
    const Self = @This();

    parent_instance: *anyopaque,

    extern fn gtk_widget_hide(self: *Self) void;
    pub const hide = gtk_widget_hide;
};
