const Cairo = @import("../cairo.zig");

pub const Surface = extern struct {
    const Self = @This();

    parent_instance: *anyopaque,

    extern fn cairo_surface_status(self: *Self) Cairo.Status;
    pub const status = cairo_surface_status;

    extern fn cairo_surface_flush(self: *Self) void;
    pub const flush = cairo_surface_flush;
};
