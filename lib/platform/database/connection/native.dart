import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../../desktopApp.dart';
import '../database.dart';
import '../../../shared/globals.dart' as globals;

SharedDatabase constructDb() {
  final db = LazyDatabase(() async {
    final file = File(await (globals.app as DesktopApp).dbPath());
    if (!await file.exists()) {
      final blob = await rootBundle.load('assets/verse_and_prayer.sqlite');
      final buffer = blob.buffer;
      await file.writeAsBytes(
          buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes));
    }
    return NativeDatabase(file);
  });
  return SharedDatabase(db);
}
