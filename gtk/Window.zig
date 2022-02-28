const Gtk = @import("../gtk.zig");

pub const Window = extern struct {
    const Self = @This();

    parent_instance: *anyopaque,

    extern fn gtk_window_set_child(application: *Window, widget: *Gtk.Widget) void;
    pub const setChild = gtk_window_set_child;

    extern fn gtk_window_set_default_size(self: *Self, width: i32, height: i32) void;
    pub const setDefaultSize = gtk_window_set_default_size;

    extern fn gtk_window_set_title(self: *Self, title: [*c]const u8) void;
    pub const setTitle = gtk_window_set_title;

    extern fn gtk_window_set_titlebar(self: *Self, titlebar: ?*Gtk.Widget) void;
    pub const setTitlebar = gtk_window_set_titlebar;
};
