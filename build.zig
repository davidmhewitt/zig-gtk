const std = @import("std");
const Builder = std.build.Builder;

const ScanProtocolsStep = @import("deps/zig-wayland/build.zig").ScanProtocolsStep;

pub fn build(b: *Builder) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();

    const scanner = ScanProtocolsStep.create(b);

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

    gdk_test.addPackage(.{
        .name = "wayland",
        .path = .{ .generated = &scanner.result },
    });
    gdk_test.step.dependOn(&scanner.step);

    gdk_test.linkLibC();

    gdk_test.linkSystemLibrary("gtk4");
    gdk_test.addPackage(glib);

    const cairo_test = b.addTest("cairo.zig");
    cairo_test.setTarget(target);
    cairo_test.setBuildMode(mode);

    cairo_test.linkLibC();

    cairo_test.linkSystemLibrary("gtk4");

    const test_step = b.step("test", "Run the tests");
    test_step.dependOn(&gtk_test.step);
    test_step.dependOn(&gdk_test.step);
    test_step.dependOn(&cairo_test.step);
}
