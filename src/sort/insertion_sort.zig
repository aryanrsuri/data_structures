const std = @import("std");

/// Insertion sort takes a < key  > value
/// and assuming that key << is sorted, compares
/// the next value and places left is less than
/// and right if greations than
/// N ^ 2 effeciency
/// Arguments:
///    array of type i64
/// Returns:
///    void (array is sorted in place)
fn insertion_sort(array: []i64) void {
    var i: usize = 1;
    while (i < array.len) : (i += 1) {
        var key: i64 = array[i];
        var j: usize = i - 1;
        std.debug.print("j : {} array.j : {}\n i: {} key : {}\n", .{ j, array[j], i, key });
        while (j >= 0 and key < array[j]) : (j -= 1) {
            array[j + 1] = array[j];
        }
        array[j + 1] = key;
    }
}

/// In use for lenth < 32
fn insertion_sort_opt(array: []i64) void {
    for (array[1..], 0..) |_, i| {
        var n = i + 1;
        while (n > 0 and array[n] < array[n - 1]) {
            std.mem.swap(i64, &array[n], &array[n - 1]);
            n -= 1;
        }
    }
}

test " isert sorty" {
    var array = [_]i64{ 2, 5, 4, 3, 6, 7 };
    std.debug.print("\n before sort array -> {any}\n", .{array});
    insertion_sort(&array);
    std.debug.print("\n before sort array -> {any}\n", .{array});
}
