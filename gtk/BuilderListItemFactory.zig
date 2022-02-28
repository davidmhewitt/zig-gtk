const Gtk = @import("../gtk.zig");
const GLib = @import("glib");

pub const BuilderListItemFactory = extern struct {
    const Self = @This();

    parent_instance: *anyopaque,

    extern fn gtk_builder_list_item_factory_new_from_bytes(scope: ?*Gtk.BuilderScope, bytes: *GLib.Bytes) ?*Self;
    pub const newFromBytes = gtk_builder_list_item_factory_new_from_bytes;

    pub fn asListItemFactory(self: *Self) *Gtk.ListItemFactory {
        return @ptrCast(*Gtk.ListItemFactory, self);
    }
};
