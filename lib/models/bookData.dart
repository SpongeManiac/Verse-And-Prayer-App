import 'package:drift/src/runtime/data_class.dart';

import '../platform/database/database.dart';
import '../shared/baseState.dart';

class BookData extends BaseDataDB {
  BookData({
    this.name = '',
    this.id,
  });

  int? id;
  String name;

  @override
  BookData copy() {
    return BookData(
      id: id,
      name: name,
    );
  }

  @override
  BookData fromEntry(DataClass dataclass) {
    BookDB data = dataclass as BookDB;
    var copy = this.copy();
    copy.id = data.id;
    copy.name = data.name;
    return copy;
  }

  @override
  BooksCompanion getCompanion() {
    return BooksCompanion(
      name: Value(name),
    );
  }

  @override
  BookDB getEntry() {
    return BookDB(
      id: id!,
      name: name,
    );
  }

  @override
  void saveData() {
    // TODO: implement saveData
  }
}
