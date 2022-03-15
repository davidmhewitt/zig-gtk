const GLib = @import("glib");

const std = @import("std");

pub const Pixbuf = extern struct {
    const Self = @This();
    parent_instance: *anyopaque,

    extern fn gdk_pixbuf_new_from_file(filename: [*c]const u8, err: ?*?*GLib.Error) ?*Self;
    pub fn newFromFile(filename: [*c]const u8) !*Self {
        var err: ?*GLib.Error = null;

        const result = gdk_pixbuf_new_from_file(filename, &err);
        if (err) |e| {
            e.free();
            return error.PixbufCreationFailed;
        } else if (result) |res| {
            return res;
        } else {
            return error.PixbufCreationFailed;
        }
    }

    extern fn gdk_pixbuf_get_bits_per_sample(self: *const Self) i32;
    pub const getBitsPerSample = gdk_pixbuf_get_bits_per_sample;

    extern fn gdk_pixbuf_get_byte_length(self: *const Self) usize;
    pub const getByteLength = gdk_pixbuf_get_byte_length;

    extern fn gdk_pixbuf_get_height(self: *const Self) i32;
    pub const getHeight = gdk_pixbuf_get_height;

    extern fn gdk_pixbuf_get_n_channels(self: *const Self) i32;
    pub const getNChannels = gdk_pixbuf_get_n_channels;

    extern fn gdk_pixbuf_get_rowstride(self: *const Self) i32;
    pub const getRowstride = gdk_pixbuf_get_rowstride;

    extern fn gdk_pixbuf_get_width(self: *const Self) i32;
    pub const getWidth = gdk_pixbuf_get_width;

    extern fn gdk_pixbuf_get_has_alpha(self: *const Self) bool;
    pub const getHasAlpha = gdk_pixbuf_get_has_alpha;

    extern fn gdk_pixbuf_read_pixels(self: *const Self) [*]const u8;
    pub fn readPixels(self: *const Self) []const u8 {
        return gdk_pixbuf_read_pixels(self)[0..self.getByteLength()];
    }

    extern fn g_object_unref(self: *const Self) void;
    pub const unref = g_object_unref;
};
