// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class SettingsDB extends DataClass implements Insertable<SettingsDB> {
  final int id;
  final int theme;
  final int color;
  final bool darkMode;
  const SettingsDB(
      {required this.id,
      required this.theme,
      required this.color,
      required this.darkMode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['theme'] = Variable<int>(theme);
    map['color'] = Variable<int>(color);
    map['dark_mode'] = Variable<bool>(darkMode);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      id: Value(id),
      theme: Value(theme),
      color: Value(color),
      darkMode: Value(darkMode),
    );
  }

  factory SettingsDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingsDB(
      id: serializer.fromJson<int>(json['id']),
      theme: serializer.fromJson<int>(json['theme']),
      color: serializer.fromJson<int>(json['color']),
      darkMode: serializer.fromJson<bool>(json['darkMode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'theme': serializer.toJson<int>(theme),
      'color': serializer.toJson<int>(color),
      'darkMode': serializer.toJson<bool>(darkMode),
    };
  }

  SettingsDB copyWith({int? id, int? theme, int? color, bool? darkMode}) =>
      SettingsDB(
        id: id ?? this.id,
        theme: theme ?? this.theme,
        color: color ?? this.color,
        darkMode: darkMode ?? this.darkMode,
      );
  @override
  String toString() {
    return (StringBuffer('SettingsDB(')
          ..write('id: $id, ')
          ..write('theme: $theme, ')
          ..write('color: $color, ')
          ..write('darkMode: $darkMode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, theme, color, darkMode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingsDB &&
          other.id == this.id &&
          other.theme == this.theme &&
          other.color == this.color &&
          other.darkMode == this.darkMode);
}

class SettingsCompanion extends UpdateCompanion<SettingsDB> {
  final Value<int> id;
  final Value<int> theme;
  final Value<int> color;
  final Value<bool> darkMode;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.theme = const Value.absent(),
    this.color = const Value.absent(),
    this.darkMode = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.id = const Value.absent(),
    this.theme = const Value.absent(),
    this.color = const Value.absent(),
    this.darkMode = const Value.absent(),
  });
  static Insertable<SettingsDB> custom({
    Expression<int>? id,
    Expression<int>? theme,
    Expression<int>? color,
    Expression<bool>? darkMode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (theme != null) 'theme': theme,
      if (color != null) 'color': color,
      if (darkMode != null) 'dark_mode': darkMode,
    });
  }

  SettingsCompanion copyWith(
      {Value<int>? id,
      Value<int>? theme,
      Value<int>? color,
      Value<bool>? darkMode}) {
    return SettingsCompanion(
      id: id ?? this.id,
      theme: theme ?? this.theme,
      color: color ?? this.color,
      darkMode: darkMode ?? this.darkMode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (theme.present) {
      map['theme'] = Variable<int>(theme.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (darkMode.present) {
      map['dark_mode'] = Variable<bool>(darkMode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('theme: $theme, ')
          ..write('color: $color, ')
          ..write('darkMode: $darkMode')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings
    with TableInfo<$SettingsTable, SettingsDB> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT',
      defaultValue: const Constant(1));
  final VerificationMeta _themeMeta = const VerificationMeta('theme');
  @override
  late final GeneratedColumn<int> theme = GeneratedColumn<int>(
      'theme', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
      'color', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0xFF000000));
  final VerificationMeta _darkModeMeta = const VerificationMeta('darkMode');
  @override
  late final GeneratedColumn<bool> darkMode = GeneratedColumn<bool>(
      'dark_mode', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK ("dark_mode" IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, theme, color, darkMode];
  @override
  String get aliasedName => _alias ?? 'settings';
  @override
  String get actualTableName => 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<SettingsDB> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('theme')) {
      context.handle(
          _themeMeta, theme.isAcceptableOrUnknown(data['theme']!, _themeMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    if (data.containsKey('dark_mode')) {
      context.handle(_darkModeMeta,
          darkMode.isAcceptableOrUnknown(data['dark_mode']!, _darkModeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SettingsDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingsDB(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      theme: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}theme'])!,
      color: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}color'])!,
      darkMode: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}dark_mode'])!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class BibleDB extends DataClass implements Insertable<BibleDB> {
  final int id;
  final String version;
  const BibleDB({required this.id, required this.version});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['version'] = Variable<String>(version);
    return map;
  }

  BiblesCompanion toCompanion(bool nullToAbsent) {
    return BiblesCompanion(
      id: Value(id),
      version: Value(version),
    );
  }

  factory BibleDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BibleDB(
      id: serializer.fromJson<int>(json['id']),
      version: serializer.fromJson<String>(json['version']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'version': serializer.toJson<String>(version),
    };
  }

  BibleDB copyWith({int? id, String? version}) => BibleDB(
        id: id ?? this.id,
        version: version ?? this.version,
      );
  @override
  String toString() {
    return (StringBuffer('BibleDB(')
          ..write('id: $id, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, version);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BibleDB &&
          other.id == this.id &&
          other.version == this.version);
}

class BiblesCompanion extends UpdateCompanion<BibleDB> {
  final Value<int> id;
  final Value<String> version;
  const BiblesCompanion({
    this.id = const Value.absent(),
    this.version = const Value.absent(),
  });
  BiblesCompanion.insert({
    this.id = const Value.absent(),
    required String version,
  }) : version = Value(version);
  static Insertable<BibleDB> custom({
    Expression<int>? id,
    Expression<String>? version,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (version != null) 'version': version,
    });
  }

  BiblesCompanion copyWith({Value<int>? id, Value<String>? version}) {
    return BiblesCompanion(
      id: id ?? this.id,
      version: version ?? this.version,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BiblesCompanion(')
          ..write('id: $id, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }
}

class $BiblesTable extends Bibles with TableInfo<$BiblesTable, BibleDB> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BiblesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _versionMeta = const VerificationMeta('version');
  @override
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
      'version', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, version];
  @override
  String get aliasedName => _alias ?? 'bibles';
  @override
  String get actualTableName => 'bibles';
  @override
  VerificationContext validateIntegrity(Insertable<BibleDB> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BibleDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BibleDB(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      version: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}version'])!,
    );
  }

  @override
  $BiblesTable createAlias(String alias) {
    return $BiblesTable(attachedDatabase, alias);
  }
}

class BookDB extends DataClass implements Insertable<BookDB> {
  final int id;
  final String bookName;
  const BookDB({required this.id, required this.bookName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['book_name'] = Variable<String>(bookName);
    return map;
  }

  BooksCompanion toCompanion(bool nullToAbsent) {
    return BooksCompanion(
      id: Value(id),
      bookName: Value(bookName),
    );
  }

  factory BookDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookDB(
      id: serializer.fromJson<int>(json['id']),
      bookName: serializer.fromJson<String>(json['bookName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bookName': serializer.toJson<String>(bookName),
    };
  }

  BookDB copyWith({int? id, String? bookName}) => BookDB(
        id: id ?? this.id,
        bookName: bookName ?? this.bookName,
      );
  @override
  String toString() {
    return (StringBuffer('BookDB(')
          ..write('id: $id, ')
          ..write('bookName: $bookName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, bookName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookDB &&
          other.id == this.id &&
          other.bookName == this.bookName);
}

class BooksCompanion extends UpdateCompanion<BookDB> {
  final Value<int> id;
  final Value<String> bookName;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.bookName = const Value.absent(),
  });
  BooksCompanion.insert({
    this.id = const Value.absent(),
    this.bookName = const Value.absent(),
  });
  static Insertable<BookDB> custom({
    Expression<int>? id,
    Expression<String>? bookName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bookName != null) 'book_name': bookName,
    });
  }

  BooksCompanion copyWith({Value<int>? id, Value<String>? bookName}) {
    return BooksCompanion(
      id: id ?? this.id,
      bookName: bookName ?? this.bookName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (bookName.present) {
      map['book_name'] = Variable<String>(bookName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksCompanion(')
          ..write('id: $id, ')
          ..write('bookName: $bookName')
          ..write(')'))
        .toString();
  }
}

class $BooksTable extends Books with TableInfo<$BooksTable, BookDB> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BooksTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _bookNameMeta = const VerificationMeta('bookName');
  @override
  late final GeneratedColumn<String> bookName = GeneratedColumn<String>(
      'book_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns => [id, bookName];
  @override
  String get aliasedName => _alias ?? 'books';
  @override
  String get actualTableName => 'books';
  @override
  VerificationContext validateIntegrity(Insertable<BookDB> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('book_name')) {
      context.handle(_bookNameMeta,
          bookName.isAcceptableOrUnknown(data['book_name']!, _bookNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookDB(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      bookName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}book_name'])!,
    );
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(attachedDatabase, alias);
  }
}

class VerseDB extends DataClass implements Insertable<VerseDB> {
  final int id;
  final int version;
  final int book;
  final int chapter;
  final int verse;
  final String verseText;
  const VerseDB(
      {required this.id,
      required this.version,
      required this.book,
      required this.chapter,
      required this.verse,
      required this.verseText});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['version'] = Variable<int>(version);
    map['book'] = Variable<int>(book);
    map['chapter'] = Variable<int>(chapter);
    map['verse'] = Variable<int>(verse);
    map['verse_text'] = Variable<String>(verseText);
    return map;
  }

  VersesCompanion toCompanion(bool nullToAbsent) {
    return VersesCompanion(
      id: Value(id),
      version: Value(version),
      book: Value(book),
      chapter: Value(chapter),
      verse: Value(verse),
      verseText: Value(verseText),
    );
  }

  factory VerseDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VerseDB(
      id: serializer.fromJson<int>(json['id']),
      version: serializer.fromJson<int>(json['version']),
      book: serializer.fromJson<int>(json['book']),
      chapter: serializer.fromJson<int>(json['chapter']),
      verse: serializer.fromJson<int>(json['verse']),
      verseText: serializer.fromJson<String>(json['verseText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'version': serializer.toJson<int>(version),
      'book': serializer.toJson<int>(book),
      'chapter': serializer.toJson<int>(chapter),
      'verse': serializer.toJson<int>(verse),
      'verseText': serializer.toJson<String>(verseText),
    };
  }

  VerseDB copyWith(
          {int? id,
          int? version,
          int? book,
          int? chapter,
          int? verse,
          String? verseText}) =>
      VerseDB(
        id: id ?? this.id,
        version: version ?? this.version,
        book: book ?? this.book,
        chapter: chapter ?? this.chapter,
        verse: verse ?? this.verse,
        verseText: verseText ?? this.verseText,
      );
  @override
  String toString() {
    return (StringBuffer('VerseDB(')
          ..write('id: $id, ')
          ..write('version: $version, ')
          ..write('book: $book, ')
          ..write('chapter: $chapter, ')
          ..write('verse: $verse, ')
          ..write('verseText: $verseText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, version, book, chapter, verse, verseText);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VerseDB &&
          other.id == this.id &&
          other.version == this.version &&
          other.book == this.book &&
          other.chapter == this.chapter &&
          other.verse == this.verse &&
          other.verseText == this.verseText);
}

class VersesCompanion extends UpdateCompanion<VerseDB> {
  final Value<int> id;
  final Value<int> version;
  final Value<int> book;
  final Value<int> chapter;
  final Value<int> verse;
  final Value<String> verseText;
  const VersesCompanion({
    this.id = const Value.absent(),
    this.version = const Value.absent(),
    this.book = const Value.absent(),
    this.chapter = const Value.absent(),
    this.verse = const Value.absent(),
    this.verseText = const Value.absent(),
  });
  VersesCompanion.insert({
    this.id = const Value.absent(),
    required int version,
    required int book,
    this.chapter = const Value.absent(),
    this.verse = const Value.absent(),
    this.verseText = const Value.absent(),
  })  : version = Value(version),
        book = Value(book);
  static Insertable<VerseDB> custom({
    Expression<int>? id,
    Expression<int>? version,
    Expression<int>? book,
    Expression<int>? chapter,
    Expression<int>? verse,
    Expression<String>? verseText,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (version != null) 'version': version,
      if (book != null) 'book': book,
      if (chapter != null) 'chapter': chapter,
      if (verse != null) 'verse': verse,
      if (verseText != null) 'verse_text': verseText,
    });
  }

  VersesCompanion copyWith(
      {Value<int>? id,
      Value<int>? version,
      Value<int>? book,
      Value<int>? chapter,
      Value<int>? verse,
      Value<String>? verseText}) {
    return VersesCompanion(
      id: id ?? this.id,
      version: version ?? this.version,
      book: book ?? this.book,
      chapter: chapter ?? this.chapter,
      verse: verse ?? this.verse,
      verseText: verseText ?? this.verseText,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (book.present) {
      map['book'] = Variable<int>(book.value);
    }
    if (chapter.present) {
      map['chapter'] = Variable<int>(chapter.value);
    }
    if (verse.present) {
      map['verse'] = Variable<int>(verse.value);
    }
    if (verseText.present) {
      map['verse_text'] = Variable<String>(verseText.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VersesCompanion(')
          ..write('id: $id, ')
          ..write('version: $version, ')
          ..write('book: $book, ')
          ..write('chapter: $chapter, ')
          ..write('verse: $verse, ')
          ..write('verseText: $verseText')
          ..write(')'))
        .toString();
  }
}

class $VersesTable extends Verses with TableInfo<$VersesTable, VerseDB> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VersesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _versionMeta = const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES "bibles" ("id")');
  final VerificationMeta _bookMeta = const VerificationMeta('book');
  @override
  late final GeneratedColumn<int> book = GeneratedColumn<int>(
      'book', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES "books" ("id")');
  final VerificationMeta _chapterMeta = const VerificationMeta('chapter');
  @override
  late final GeneratedColumn<int> chapter = GeneratedColumn<int>(
      'chapter', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _verseMeta = const VerificationMeta('verse');
  @override
  late final GeneratedColumn<int> verse = GeneratedColumn<int>(
      'verse', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _verseTextMeta = const VerificationMeta('verseText');
  @override
  late final GeneratedColumn<String> verseText = GeneratedColumn<String>(
      'verse_text', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns =>
      [id, version, book, chapter, verse, verseText];
  @override
  String get aliasedName => _alias ?? 'verses';
  @override
  String get actualTableName => 'verses';
  @override
  VerificationContext validateIntegrity(Insertable<VerseDB> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('book')) {
      context.handle(
          _bookMeta, book.isAcceptableOrUnknown(data['book']!, _bookMeta));
    } else if (isInserting) {
      context.missing(_bookMeta);
    }
    if (data.containsKey('chapter')) {
      context.handle(_chapterMeta,
          chapter.isAcceptableOrUnknown(data['chapter']!, _chapterMeta));
    }
    if (data.containsKey('verse')) {
      context.handle(
          _verseMeta, verse.isAcceptableOrUnknown(data['verse']!, _verseMeta));
    }
    if (data.containsKey('verse_text')) {
      context.handle(_verseTextMeta,
          verseText.isAcceptableOrUnknown(data['verse_text']!, _verseTextMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VerseDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VerseDB(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      version: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      book: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}book'])!,
      chapter: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}chapter'])!,
      verse: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}verse'])!,
      verseText: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}verse_text'])!,
    );
  }

  @override
  $VersesTable createAlias(String alias) {
    return $VersesTable(attachedDatabase, alias);
  }
}

class PrayerDB extends DataClass implements Insertable<PrayerDB> {
  final int id;
  final String name;
  final String prayerText;
  const PrayerDB(
      {required this.id, required this.name, required this.prayerText});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['prayer_text'] = Variable<String>(prayerText);
    return map;
  }

  PrayersCompanion toCompanion(bool nullToAbsent) {
    return PrayersCompanion(
      id: Value(id),
      name: Value(name),
      prayerText: Value(prayerText),
    );
  }

  factory PrayerDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrayerDB(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      prayerText: serializer.fromJson<String>(json['prayerText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'prayerText': serializer.toJson<String>(prayerText),
    };
  }

  PrayerDB copyWith({int? id, String? name, String? prayerText}) => PrayerDB(
        id: id ?? this.id,
        name: name ?? this.name,
        prayerText: prayerText ?? this.prayerText,
      );
  @override
  String toString() {
    return (StringBuffer('PrayerDB(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('prayerText: $prayerText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, prayerText);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrayerDB &&
          other.id == this.id &&
          other.name == this.name &&
          other.prayerText == this.prayerText);
}

class PrayersCompanion extends UpdateCompanion<PrayerDB> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> prayerText;
  const PrayersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.prayerText = const Value.absent(),
  });
  PrayersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String prayerText,
  })  : name = Value(name),
        prayerText = Value(prayerText);
  static Insertable<PrayerDB> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? prayerText,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (prayerText != null) 'prayer_text': prayerText,
    });
  }

  PrayersCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? prayerText}) {
    return PrayersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      prayerText: prayerText ?? this.prayerText,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (prayerText.present) {
      map['prayer_text'] = Variable<String>(prayerText.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrayersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('prayerText: $prayerText')
          ..write(')'))
        .toString();
  }
}

class $PrayersTable extends Prayers with TableInfo<$PrayersTable, PrayerDB> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrayersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _prayerTextMeta = const VerificationMeta('prayerText');
  @override
  late final GeneratedColumn<String> prayerText = GeneratedColumn<String>(
      'prayer_text', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, prayerText];
  @override
  String get aliasedName => _alias ?? 'prayers';
  @override
  String get actualTableName => 'prayers';
  @override
  VerificationContext validateIntegrity(Insertable<PrayerDB> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('prayer_text')) {
      context.handle(
          _prayerTextMeta,
          prayerText.isAcceptableOrUnknown(
              data['prayer_text']!, _prayerTextMeta));
    } else if (isInserting) {
      context.missing(_prayerTextMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PrayerDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrayerDB(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      prayerText: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}prayer_text'])!,
    );
  }

  @override
  $PrayersTable createAlias(String alias) {
    return $PrayersTable(attachedDatabase, alias);
  }
}

abstract class _$SharedDatabase extends GeneratedDatabase {
  _$SharedDatabase(QueryExecutor e) : super(e);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $BiblesTable bibles = $BiblesTable(this);
  late final $BooksTable books = $BooksTable(this);
  late final $VersesTable verses = $VersesTable(this);
  late final $PrayersTable prayers = $PrayersTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [settings, bibles, books, verses, prayers];
}
