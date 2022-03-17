pub const Context = @import("cairo/Context.zig").Context;
pub const ImageSurface = @import("cairo/ImageSurface.zig").ImageSurface;
pub const Pattern = @import("cairo/Pattern.zig").Pattern;
pub const Surface = @import("cairo/Surface.zig").Surface;
pub usingnamespace @import("cairo/enums.zig");

fn refAllDeclsRecursive(comptime T: type) void {
    comptime {
        for (@import("std").meta.declarations(T)) |decl| {
            if (decl.is_pub) {
                switch (decl.data) {
                    .Type => |T2| refAllDeclsRecursive(T2),
                    else => _ = decl,
                }
            }
        }
    }
}

test {
    @setEvalBranchQuota(100000);
    refAllDeclsRecursive(@This());
}
