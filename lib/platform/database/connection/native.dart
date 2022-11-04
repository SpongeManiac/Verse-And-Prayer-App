import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import '../../desktopApp.dart';
import '../database.dart';
import '../../../shared/globals.dart' as globals;

SharedDatabase constructDb() {
  final db = LazyDatabase(() async {
    final file = File(await (globals.app as DesktopApp).dbPath());
    return NativeDatabase(file);
  });
  return SharedDatabase(db);
}
