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
    return BookData(
      id: data.id,
      name: data.name,
    );
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
  Future<void> saveData() async {}
}
