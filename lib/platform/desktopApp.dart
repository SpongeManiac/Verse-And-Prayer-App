import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:window_manager/window_manager.dart';
import '../shared/globals.dart' as globals;
import '../shared/baseApp.dart';
import '../models/settingsData.dart';
import '../shared/colorMaterializer.dart';
import 'package:path_provider/path_provider.dart';

BaseApp getApp() {
  return DesktopApp(
    navTitle: 'DeviceApp',
  );
}

class DesktopApp extends BaseApp {
  DesktopApp({super.key, super.navTitle}) : super();

  final dbName = 'prayer_and_verse';
  final dbType = '.sqlite';

  Future<Directory> dbFolder() async {
    return getApplicationDocumentsDirectory();
  }

  Future<String> dbPath() async {
    var path = p.join((await dbFolder()).path, '$dbName$dbType');
    print('db path: $path');
    return path;
  }

  Future<bool> closeDialog(BuildContext context) async {
    bool result = await navigation.exitDialog(context);
    print('closeDialog result: $result');
    return result;
  }

  @override
  Future<void> closeApp(BuildContext context) async {
    if (kIsWeb) return;
    bool result = await closeDialog(context);
    print('got dialog result');
    if (result) {
      if (Platform.isAndroid) {
        //Android
        SystemNavigator.pop();
      } else if (Platform.isIOS) {
        // IOS
        exit(0);
      } else {
        windowManager.destroy();
      }
    }
  }

  @override
  State<DesktopApp> createState() => _DesktopAppState();
}

class _DesktopAppState extends State<DesktopApp> {
  _DesktopAppState();

  @override
  Widget build(BuildContext context) {
    //return Text('');
    return ValueListenableBuilder<SettingsData>(
      valueListenable: widget.settingsNotifier,
      builder: ((context, settings, _) {
        var theme =
            ColorMaterializer.getTheme(globals.app.theme, settings.darkMode);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: widget.appTitle,
          theme: theme.data,
          home: widget.appScaffold(),
        );
      }),
    );
  }
}
