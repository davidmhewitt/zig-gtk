pub usingnamespace @import("gtk/enums.zig");

pub const Application = @import("gtk/Application.zig").Application;
pub const ApplicationWindow = @import("gtk/ApplicationWindow.zig").ApplicationWindow;
pub const Box = @import("gtk/Box.zig").Box;
pub const BuilderListItemFactory = @import("gtk/BuilderListItemFactory.zig").BuilderListItemFactory;
pub const BuilderScope = @import("gtk/BuilderScope.zig").BuilderScope;
pub const ListItemFactory = @import("gtk/ListItemFactory.zig").ListItemFactory;
pub const SelectionModel = @import("gtk/SelectionModel.zig").SelectionModel;
pub const SingleSelection = @import("gtk/SingleSelection.zig").SingleSelection;
pub const GridView = @import("gtk/GridView.zig").GridView;
pub const Widget = @import("gtk/Widget.zig").Widget;
pub const Window = @import("gtk/Window.zig").Window;

extern fn gtk_init() void;
pub const init = gtk_init;

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
