const Gtk = @import("../gtk.zig");
const c = @import("c.zig");

pub const GridView = extern struct {
    const Self = @This();

    parent_instance: *anyopaque,

    extern fn gtk_grid_view_new(selection_model: ?*Gtk.SelectionModel, factory: ?*Gtk.ListItemFactory) ?*GridView;
    pub const new = gtk_grid_view_new;

    extern fn gtk_grid_view_set_single_click_activate(self: *Self, single_click_activate: bool) void;
    pub const setSingleClickActivate = gtk_grid_view_set_single_click_activate;

    pub fn connectActivate(self: *Self, callback: fn (self: *Self, position: u32, data: ?*anyopaque) callconv(.C) void, data: ?*anyopaque) u64 {
        return c.g_signal_connect_data(self, "activate", @ptrCast(c.GCallback, callback), data, null, @as(c.GConnectFlags, 0));
    }

    pub fn asWidget(self: *Self) *Gtk.Widget {
        return @ptrCast(*Gtk.Widget, self);
    }
};
