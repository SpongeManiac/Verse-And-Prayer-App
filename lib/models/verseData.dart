import 'package:drift/src/runtime/data_class.dart';

import '../platform/database/database.dart';
import '../shared/baseState.dart';

class VerseData extends BaseDataDB {
  VerseData({
    required this.book,
    required this.version,
    this.chapter = 0,
    this.verse = 0,
    this.text = '',
    this.id,
  });

  int? id;
  String version;
  int book;
  int chapter;
  int verse;
  String text;

  @override
  VerseData copy() {
    return VerseData(
      book: book,
      version: version,
      chapter: chapter,
      verse: verse,
      text: text,
      id: id,
    );
  }

  @override
  VerseData fromEntry(DataClass dataclass) {
    VerseDB data = dataclass as VerseDB;
    var copy = this.copy();
    copy.id = data.id;
    copy.version = data.version;
    copy.book = data.book;
    copy.chapter = data.chapter;
    copy.verse = data.verse;
    copy.text = data.verseText;
    return copy;
  }

  @override
  VersesCompanion getCompanion() {
    return VersesCompanion(
      version: Value(version),
      book: Value(book),
      chapter: Value(chapter),
      verse: Value(verse),
      verseText: Value(text),
    );
  }

  @override
  VerseDB getEntry() {
    return VerseDB(
      id: id!,
      version: version,
      book: book,
      chapter: chapter,
      verse: verse,
      verseText: text,
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
