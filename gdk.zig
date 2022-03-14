pub const Display = @import("gdk/Display.zig").Display;
pub const Pixbuf = @import("gdk/Pixbuf.zig").Pixbuf;
pub const Wayland = @import("gdk/Wayland.zig");

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
