const Cairo = @import("../cairo.zig");

pub const Pattern = extern struct {
    const Self = @This();

    parent_instance: *anyopaque,

    extern fn cairo_pattern_get_surface(self: *Self, surface: **Cairo.Surface) Cairo.Status;
    pub fn getSurface(self: *Self) !*Cairo.Surface {
        var surface: *Cairo.Surface = undefined;
        const result = cairo_pattern_get_surface(self, &surface);
        if (result != .Success) {
            return error.FailedToGetSurface;
        } else {
            return surface;
        }
    }
};
