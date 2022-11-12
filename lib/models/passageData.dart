import 'package:drift/src/runtime/data_class.dart';
import 'package:verse_prayer_study/platform/database/database.dart';

import '../shared/baseState.dart';

class PassageData extends BaseDataDB {
  PassageData({
    this.v1 = 0,
    this.v2 = 0,
    this.bible = '',
    this.book = '',
    this.start = '',
    this.end = '',
    this.passage = '',
    this.id,
  });

  int? id;
  int v1;
  int v2;
  String bible;
  String book;
  String start;
  String end;
  String passage;

  @override
  PassageData copy() {
    return PassageData(
      id: id,
      v1: v1,
      v2: v2,
      bible: bible,
      book: book,
      start: start,
      end: end,
      passage: passage,
    );
  }

  @override
  PassageData fromEntry(DataClass dataclass) {
    PassageDB data = dataclass as PassageDB;
    return PassageData(
      id: data.id,
      v1: data.startVerse,
      v2: data.endVerse,
      bible: data.bible,
      book: data.book,
      start: data.start,
      end: data.end,
      passage: data.passage,
    );
  }

  @override
  PassagesCompanion getCompanion() {
    return PassagesCompanion(
      startVerse: Value(v1),
      endVerse: Value(v2),
      bible: Value(bible),
      book: Value(book),
      start: Value(start),
      end: Value(end),
      passage: Value(passage),
    );
  }

  @override
  PassageDB getEntry() {
    return PassageDB(
      id: id!,
      startVerse: v1,
      endVerse: v2,
      bible: bible,
      book: bible,
      start: bible,
      end: bible,
      passage: passage,
    );
  }

  @override
  Future<void> saveData() async {
    id ??= -1;
    if (await db.passageExists(id!)) {
      print('Updating passage: $id');
      await db.updatePassage(getEntry());
    } else {
      print('Creating passage: $id');
      id = await db.setPassage(getCompanion());
    }
  }
}
