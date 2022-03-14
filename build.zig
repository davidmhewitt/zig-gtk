const std = @import("std");
const Builder = std.build.Builder;

pub fn build(b: *Builder) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();

    const gtk_test = b.addTest("gtk.zig");
    gtk_test.setTarget(target);
    gtk_test.setBuildMode(mode);

    gtk_test.linkLibC();
    const glib = std.build.Pkg{ .name = "glib", .path = .{ .path = "deps/zig-glib/glib.zig" } };

    gtk_test.linkSystemLibrary("gtk4");
    gtk_test.addPackage(glib);

    const gdk_test = b.addTest("gdk.zig");
    gdk_test.setTarget(target);
    gdk_test.setBuildMode(mode);

    gdk_test.linkLibC();

    gdk_test.linkSystemLibrary("gtk4");
    gdk_test.addPackage(glib);

    const test_step = b.step("test", "Run the tests");
    test_step.dependOn(&gtk_test.step);
    test_step.dependOn(&gdk_test.step);
}
