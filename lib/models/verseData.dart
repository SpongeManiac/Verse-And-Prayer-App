import 'package:drift/src/runtime/data_class.dart';

import '../platform/database/database.dart';
import '../shared/baseState.dart';

class VerseData extends BaseDataDB {
  VerseData({
    this.chapter = 0,
    this.verse = 0,
    this.text = '',
    this.id,
  });

  int? id;
  int chapter;
  int verse;
  String text;

  @override
  VerseData copy() {
    return VerseData(
      id: id,
      chapter: chapter,
      verse: verse,
      text: text,
    );
  }

  @override
  VerseData fromEntry(DataClass dataclass) {
    VerseDB data = dataclass as VerseDB;
    var copy = this.copy();
    copy.id = data.id;
    copy.chapter = data.chapter;
    copy.verse = data.verse;
    copy.text = data.scripture;
    return copy;
  }

  @override
  VersesCompanion getCompanion() {
    return VersesCompanion(
      chapter: Value(chapter),
      verse: Value(verse),
      scripture: Value(text),
    );
  }

  @override
  VerseDB getEntry() {
    return VerseDB(
      id: id!,
      chapter: chapter,
      verse: verse,
      scripture: text,
    );
  }

  @override
  Future<void> saveData() async {
    // id ??= -1;
    // if (await db.verseExists(id!)) {
    //   await db.updateVerseData(getEntry());
    // } else {
    //   id = await db.setVerseData(getCompanion());
    // }
  }
}
