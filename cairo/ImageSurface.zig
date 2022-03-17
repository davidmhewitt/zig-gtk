const Cairo = @import("../cairo.zig");

pub const ImageSurface = extern struct {
    const Self = @This();

    parent_instance: *anyopaque,

    extern fn cairo_image_surface_create(format: Cairo.Format, width: i32, height: i32) ?*Self;
    pub const create = cairo_image_surface_create;

    extern fn cairo_image_surface_get_data(self: *Self) [*]u8;
    pub const getData = cairo_image_surface_get_data;

    extern fn cairo_image_surface_get_width(self: *Self) i32;
    pub const getWidth = cairo_image_surface_get_width;

    extern fn cairo_image_surface_get_height(self: *Self) i32;
    pub const getHeight = cairo_image_surface_get_height;

    extern fn cairo_image_surface_get_stride(self: *Self) i32;
    pub const getStride = cairo_image_surface_get_stride;

    extern fn cairo_surface_destroy(self: *Self) void;
    pub const destroy = cairo_surface_destroy;

    pub fn asSurface(self: *Self) *Cairo.Surface {
        return @ptrCast(*Cairo.Surface, self);
    }
};
