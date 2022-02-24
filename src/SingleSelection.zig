const Gtk = @import("../gtk.zig");
const GLib = @import("glib");

pub const SingleSelection = extern struct {
    const Self = @This();

    parent_instance: *anyopaque,

    extern fn gtk_single_selection_new(model: ?*GLib.ListModel) ?*SingleSelection;
    pub const new = gtk_single_selection_new;

    pub fn asSelectionModel(self: *Self) *Gtk.SelectionModel {
        return @ptrCast(*Gtk.SelectionModel, self);
    }
};
