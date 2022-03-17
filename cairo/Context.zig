const Cairo = @import("../cairo.zig");

pub const Context = extern struct {
    const Self = @This();

    parent_instance: *anyopaque,

    extern fn cairo_create(surface: *Cairo.Surface) ?*Self;
    pub const create = cairo_create;

    extern fn cairo_get_source(self: *Self) *Cairo.Pattern;
    pub const getSource = cairo_get_source;

    extern fn cairo_destroy(self: *Self) void;
    pub const destroy = cairo_destroy;
};
