import 'package:drift/src/runtime/data_class.dart';
import 'package:verse_prayer_study/platform/database/database.dart';

import '../shared/baseState.dart';

class SettingsData extends BaseDataDB {
  SettingsData(
    this.theme,
    this.color, [
    this.darkMode = false,
  ]);

  int theme;
  int color;
  bool darkMode;

  @override
  SettingsData copy() {
    return SettingsData(
      theme,
      color,
      darkMode,
    );
  }

  @override
  SettingsData fromEntry(DataClass dataclass) {
    SettingsDB data = dataclass as SettingsDB;
    var copy = this.copy();
    copy.theme = data.theme;
    copy.color = data.color;
    copy.darkMode = data.darkmode;
    return copy;
  }

  @override
  SettingsCompanion getCompanion() {
    return getEntry().toCompanion(true);
  }

  @override
  SettingsDB getEntry() {
    return SettingsDB(
      id: 1,
      theme: theme,
      color: color,
      darkmode: darkMode,
    );
  }

  @override
  void saveData() {
    db.setSettings(getEntry());
  }
}
