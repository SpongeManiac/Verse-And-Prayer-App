import 'package:drift/src/runtime/data_class.dart';

import '../platform/database/database.dart';
import '../shared/baseState.dart';

class BibleData extends BaseDataDB {
  BibleData({
    this.language = '',
    this.name = '',
    this.abr = '',
    this.id,
  });

  int? id;
  String language;
  String name;
  String abr;

  @override
  BibleData copy() {
    return BibleData(
      id: id,
      language: language,
      name: name,
      abr: abr,
    );
  }

  @override
  BibleData fromEntry(DataClass dataclass) {
    BibleDB data = dataclass as BibleDB;
    var copy = this.copy();
    copy.id = data.id;
    copy.language = data.language;
    copy.name = data.name;
    copy.abr = data.abr;
    return copy;
  }

  @override
  BiblesCompanion getCompanion() {
    return BiblesCompanion(
      language: Value(language),
      name: Value(name),
      abr: Value(abr),
    );
  }

  @override
  BibleDB getEntry() {
    return BibleDB(
      id: id!,
      language: language,
      name: name,
      abr: abr,
    );
  }

  @override
  void saveData() {
    // TODO: implement saveData
  }
}
