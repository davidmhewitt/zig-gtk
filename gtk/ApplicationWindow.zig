const Gtk = @import("../gtk.zig");

pub const ApplicationWindow = extern struct {
    const Self = @This();

    parent_instance: *anyopaque,

    extern fn gtk_application_window_new(application: *Gtk.Application) ?*ApplicationWindow;
    pub const new = gtk_application_window_new;

    extern fn g_object_unref(application: *Gtk.Application) void;
    pub const unref = g_object_unref;

    extern fn gtk_widget_show(widget: *ApplicationWindow) void;
    pub const show = gtk_widget_show;

    pub fn asWindow(self: *Self) *Gtk.Window {
        return @ptrCast(*Gtk.Window, self);
    }
};
