pub const Gtk = @import("../gtk.zig");

pub const Box = extern struct {
    const Self = @This();
    parent_instance: *anyopaque,

    extern fn gtk_box_new(orientation: Gtk.Orientation, spacing: i32) ?*Self;
    pub const new = gtk_box_new;

    pub fn asWidget(self: *Self) *Gtk.Widget {
        return @ptrCast(*Gtk.Widget, self);
    }
};
