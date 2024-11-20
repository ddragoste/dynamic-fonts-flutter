import 'dart:typed_data' show ByteData;

import 'file_io_stub.dart' // Stubbed implementation by default.
// Concrete implementation if File IO is available.
    if (dart.library.io) 'file_io_desktop_and_mobile.dart' as file_io;

bool get isMacOS => file_io.isMacOS;
bool get isAndroid => file_io.isAndroid;
bool get isTest => file_io.isTest;

/// Signature of method that can be used to save font to device.
typedef SaveFontToDeviceFileSystemFn = Future<void> Function({
  required String name,
  required String fileHash,
  required List<int> bytes,
});

/// Signature of method that can be used to save font to device.
typedef LoadFontFromDeviceFileSystemFn = Future<ByteData?> Function({
  required String name,
  required String fileHash,
});

SaveFontToDeviceFileSystemFn? _saveFontToDeviceFileSystem =
    file_io.saveFontToDeviceFileSystem;

LoadFontFromDeviceFileSystemFn? _loadFontFromDeviceFileSystem =
    file_io.loadFontFromDeviceFileSystem;

void initializeIO({
  SaveFontToDeviceFileSystemFn? saveFn,
  LoadFontFromDeviceFileSystemFn? loadFn,
}) {
  _saveFontToDeviceFileSystem = saveFn;
  _loadFontFromDeviceFileSystem = loadFn;
}

/// Current definition of save function based on platform.
/// By default stubbed out but can be assigned to something else.
/// On mobile & desktop this saves to file system, see: [file_io_desktop_and_mobile.dart]
SaveFontToDeviceFileSystemFn? get saveFontToDeviceFileSystem =>
    _saveFontToDeviceFileSystem;

/// Current definition of load function based on platform.
/// By default stubbed out but can be assigned to something else.
/// On mobile & desktop this loads from file system, see: [file_io_desktop_and_mobile.dart]
LoadFontFromDeviceFileSystemFn? get loadFontFromDeviceFileSystem =>
    _loadFontFromDeviceFileSystem;
