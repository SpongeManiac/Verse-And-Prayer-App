import 'package:drift/src/runtime/data_class.dart';
import 'package:verse_prayer_study/shared/baseState.dart';

import '../platform/database/database.dart';

class PrayerData extends BaseDataDB {
  PrayerData({
    this.name = '',
    this.prayer = '',
    this.id,
  });

  int? id;
  String name;
  String prayer;

  @override
  PrayerData copy() {
    return PrayerData(
      id: id,
      name: name,
      prayer: prayer,
    );
  }

  @override
  PrayerData fromEntry(DataClass dataclass) {
    PrayerDB data = dataclass as PrayerDB;
    return PrayerData(
      id: data.id,
      name: data.name,
      prayer: data.prayer,
    );
  }

  @override
  PrayersCompanion getCompanion() {
    return PrayersCompanion(
      name: Value(name),
      prayer: Value(prayer),
    );
  }

  @override
  PrayerDB getEntry() {
    return PrayerDB(
      id: id!,
      name: name,
      prayer: prayer,
    );
  }

  @override
  Future<void> saveData() async {}
}
