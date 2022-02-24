const Gtk = @import("../gtk.zig");

pub const Window = extern struct {
    const Self = @This();

    parent_instance: *anyopaque,

    extern fn gtk_window_set_child(application: *Window, widget: *Gtk.Widget) void;
    pub const setChild = gtk_window_set_child;

    extern fn gtk_window_set_default_size(self: *Self, width: i32, height: i32) void;
    pub const setDefaultSize = gtk_window_set_default_size;
};
