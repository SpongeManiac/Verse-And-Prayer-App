export '../platform/unsupportedApp.dart'
    if (dart.library.io) '../platform/desktopApp.dart'
    if (dart.library.html) '../platform/unsupportedApp.dart';
