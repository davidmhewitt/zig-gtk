const Gtk = @import("../gtk.zig");
const GLib = @import("glib");
const c = @import("c.zig");

pub const Application = extern struct {
    const Self = @This();

    parent_instance: *anyopaque,

    extern fn gtk_application_new(id: [*:0]const u8, flags: c_int) ?*Application;
    pub const new = gtk_application_new;

    extern fn g_object_unref(obj: *anyopaque) void;
    pub const unref = g_object_unref;

    pub fn connectActivate(self: *Self, callback: fn (app: *Self, data: ?*anyopaque) callconv(.C) void, data: ?*anyopaque) u64 {
        return c.g_signal_connect_data(self, "activate", @ptrCast(c.GCallback, callback), data, null, @as(c.GConnectFlags, 0));
    }

    pub fn run(self: *Self, argc: usize, argv: *[][*]u8) u8 {
        const result = c.g_application_run(@ptrCast(*c.GApplication, self), @intCast(c_int, argc), @ptrCast([*c][*c]u8, argv.*));
        return @intCast(u8, result);
    }

    pub fn asGApplication(self: *Self) *GLib.Application {
        return @ptrCast(*GLib.Application, self);
    }
};
