import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'shared/globals.dart' as globals;

bool get isMobile {
  return Platform.isAndroid || Platform.isIOS;
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  () async {
    if (!isMobile) {
      await windowManager.ensureInitialized();
    }
    await globals.app.loadSettings().then((value) async {
      runApp(globals.app);
    });
  }();
}
