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
  final bool darkmode;
  const SettingsDB(
      {required this.id,
      required this.theme,
      required this.color,
      required this.darkmode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['theme'] = Variable<int>(theme);
    map['color'] = Variable<int>(color);
    map['darkmode'] = Variable<bool>(darkmode);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      id: Value(id),
      theme: Value(theme),
      color: Value(color),
      darkmode: Value(darkmode),
    );
  }

  factory SettingsDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingsDB(
      id: serializer.fromJson<int>(json['id']),
      theme: serializer.fromJson<int>(json['theme']),
      color: serializer.fromJson<int>(json['color']),
      darkmode: serializer.fromJson<bool>(json['darkmode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'theme': serializer.toJson<int>(theme),
      'color': serializer.toJson<int>(color),
      'darkmode': serializer.toJson<bool>(darkmode),
    };
  }

  SettingsDB copyWith({int? id, int? theme, int? color, bool? darkmode}) =>
      SettingsDB(
        id: id ?? this.id,
        theme: theme ?? this.theme,
        color: color ?? this.color,
        darkmode: darkmode ?? this.darkmode,
      );
  @override
  String toString() {
    return (StringBuffer('SettingsDB(')
          ..write('id: $id, ')
          ..write('theme: $theme, ')
          ..write('color: $color, ')
          ..write('darkmode: $darkmode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, theme, color, darkmode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingsDB &&
          other.id == this.id &&
          other.theme == this.theme &&
          other.color == this.color &&
          other.darkmode == this.darkmode);
}

class SettingsCompanion extends UpdateCompanion<SettingsDB> {
  final Value<int> id;
  final Value<int> theme;
  final Value<int> color;
  final Value<bool> darkmode;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.theme = const Value.absent(),
    this.color = const Value.absent(),
    this.darkmode = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.id = const Value.absent(),
    this.theme = const Value.absent(),
    this.color = const Value.absent(),
    this.darkmode = const Value.absent(),
  });
  static Insertable<SettingsDB> custom({
    Expression<int>? id,
    Expression<int>? theme,
    Expression<int>? color,
    Expression<bool>? darkmode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (theme != null) 'theme': theme,
      if (color != null) 'color': color,
      if (darkmode != null) 'darkmode': darkmode,
    });
  }

  SettingsCompanion copyWith(
      {Value<int>? id,
      Value<int>? theme,
      Value<int>? color,
      Value<bool>? darkmode}) {
    return SettingsCompanion(
      id: id ?? this.id,
      theme: theme ?? this.theme,
      color: color ?? this.color,
      darkmode: darkmode ?? this.darkmode,
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
    if (darkmode.present) {
      map['darkmode'] = Variable<bool>(darkmode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('theme: $theme, ')
          ..write('color: $color, ')
          ..write('darkmode: $darkmode')
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
  final VerificationMeta _darkmodeMeta = const VerificationMeta('darkmode');
  @override
  late final GeneratedColumn<bool> darkmode = GeneratedColumn<bool>(
      'darkmode', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK ("darkmode" IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, theme, color, darkmode];
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
    if (data.containsKey('darkmode')) {
      context.handle(_darkmodeMeta,
          darkmode.isAcceptableOrUnknown(data['darkmode']!, _darkmodeMeta));
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
      darkmode: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}darkmode'])!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class BibleDB extends DataClass implements Insertable<BibleDB> {
  final int id;
  final String language;
  final String name;
  final String abr;
  const BibleDB(
      {required this.id,
      required this.language,
      required this.name,
      required this.abr});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['language'] = Variable<String>(language);
    map['name'] = Variable<String>(name);
    map['abr'] = Variable<String>(abr);
    return map;
  }

  BiblesCompanion toCompanion(bool nullToAbsent) {
    return BiblesCompanion(
      id: Value(id),
      language: Value(language),
      name: Value(name),
      abr: Value(abr),
    );
  }

  factory BibleDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BibleDB(
      id: serializer.fromJson<int>(json['id']),
      language: serializer.fromJson<String>(json['language']),
      name: serializer.fromJson<String>(json['name']),
      abr: serializer.fromJson<String>(json['abr']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'language': serializer.toJson<String>(language),
      'name': serializer.toJson<String>(name),
      'abr': serializer.toJson<String>(abr),
    };
  }

  BibleDB copyWith({int? id, String? language, String? name, String? abr}) =>
      BibleDB(
        id: id ?? this.id,
        language: language ?? this.language,
        name: name ?? this.name,
        abr: abr ?? this.abr,
      );
  @override
  String toString() {
    return (StringBuffer('BibleDB(')
          ..write('id: $id, ')
          ..write('language: $language, ')
          ..write('name: $name, ')
          ..write('abr: $abr')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, language, name, abr);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BibleDB &&
          other.id == this.id &&
          other.language == this.language &&
          other.name == this.name &&
          other.abr == this.abr);
}

class BiblesCompanion extends UpdateCompanion<BibleDB> {
  final Value<int> id;
  final Value<String> language;
  final Value<String> name;
  final Value<String> abr;
  const BiblesCompanion({
    this.id = const Value.absent(),
    this.language = const Value.absent(),
    this.name = const Value.absent(),
    this.abr = const Value.absent(),
  });
  BiblesCompanion.insert({
    this.id = const Value.absent(),
    required String language,
    required String name,
    required String abr,
  })  : language = Value(language),
        name = Value(name),
        abr = Value(abr);
  static Insertable<BibleDB> custom({
    Expression<int>? id,
    Expression<String>? language,
    Expression<String>? name,
    Expression<String>? abr,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (language != null) 'language': language,
      if (name != null) 'name': name,
      if (abr != null) 'abr': abr,
    });
  }

  BiblesCompanion copyWith(
      {Value<int>? id,
      Value<String>? language,
      Value<String>? name,
      Value<String>? abr}) {
    return BiblesCompanion(
      id: id ?? this.id,
      language: language ?? this.language,
      name: name ?? this.name,
      abr: abr ?? this.abr,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (abr.present) {
      map['abr'] = Variable<String>(abr.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BiblesCompanion(')
          ..write('id: $id, ')
          ..write('language: $language, ')
          ..write('name: $name, ')
          ..write('abr: $abr')
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
  final VerificationMeta _languageMeta = const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _abrMeta = const VerificationMeta('abr');
  @override
  late final GeneratedColumn<String> abr = GeneratedColumn<String>(
      'abr', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, language, name, abr];
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
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('abr')) {
      context.handle(
          _abrMeta, abr.isAcceptableOrUnknown(data['abr']!, _abrMeta));
    } else if (isInserting) {
      context.missing(_abrMeta);
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
      language: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}language'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      abr: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}abr'])!,
    );
  }

  @override
  $BiblesTable createAlias(String alias) {
    return $BiblesTable(attachedDatabase, alias);
  }
}

class BookDB extends DataClass implements Insertable<BookDB> {
  final int id;
  final String name;
  const BookDB({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  BooksCompanion toCompanion(bool nullToAbsent) {
    return BooksCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory BookDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookDB(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  BookDB copyWith({int? id, String? name}) => BookDB(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('BookDB(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookDB && other.id == this.id && other.name == this.name);
}

class BooksCompanion extends UpdateCompanion<BookDB> {
  final Value<int> id;
  final Value<String> name;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  BooksCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  static Insertable<BookDB> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  BooksCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return BooksCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
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
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns => [id, name];
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
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
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
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(attachedDatabase, alias);
  }
}

class BibleBookDB extends DataClass implements Insertable<BibleBookDB> {
  final int id;
  final int bibleID;
  final int bookID;
  const BibleBookDB(
      {required this.id, required this.bibleID, required this.bookID});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bible_i_d'] = Variable<int>(bibleID);
    map['book_i_d'] = Variable<int>(bookID);
    return map;
  }

  BibleBooksCompanion toCompanion(bool nullToAbsent) {
    return BibleBooksCompanion(
      id: Value(id),
      bibleID: Value(bibleID),
      bookID: Value(bookID),
    );
  }

  factory BibleBookDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BibleBookDB(
      id: serializer.fromJson<int>(json['id']),
      bibleID: serializer.fromJson<int>(json['bibleID']),
      bookID: serializer.fromJson<int>(json['bookID']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bibleID': serializer.toJson<int>(bibleID),
      'bookID': serializer.toJson<int>(bookID),
    };
  }

  BibleBookDB copyWith({int? id, int? bibleID, int? bookID}) => BibleBookDB(
        id: id ?? this.id,
        bibleID: bibleID ?? this.bibleID,
        bookID: bookID ?? this.bookID,
      );
  @override
  String toString() {
    return (StringBuffer('BibleBookDB(')
          ..write('id: $id, ')
          ..write('bibleID: $bibleID, ')
          ..write('bookID: $bookID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, bibleID, bookID);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BibleBookDB &&
          other.id == this.id &&
          other.bibleID == this.bibleID &&
          other.bookID == this.bookID);
}

class BibleBooksCompanion extends UpdateCompanion<BibleBookDB> {
  final Value<int> id;
  final Value<int> bibleID;
  final Value<int> bookID;
  const BibleBooksCompanion({
    this.id = const Value.absent(),
    this.bibleID = const Value.absent(),
    this.bookID = const Value.absent(),
  });
  BibleBooksCompanion.insert({
    this.id = const Value.absent(),
    required int bibleID,
    required int bookID,
  })  : bibleID = Value(bibleID),
        bookID = Value(bookID);
  static Insertable<BibleBookDB> custom({
    Expression<int>? id,
    Expression<int>? bibleID,
    Expression<int>? bookID,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bibleID != null) 'bible_i_d': bibleID,
      if (bookID != null) 'book_i_d': bookID,
    });
  }

  BibleBooksCompanion copyWith(
      {Value<int>? id, Value<int>? bibleID, Value<int>? bookID}) {
    return BibleBooksCompanion(
      id: id ?? this.id,
      bibleID: bibleID ?? this.bibleID,
      bookID: bookID ?? this.bookID,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (bibleID.present) {
      map['bible_i_d'] = Variable<int>(bibleID.value);
    }
    if (bookID.present) {
      map['book_i_d'] = Variable<int>(bookID.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BibleBooksCompanion(')
          ..write('id: $id, ')
          ..write('bibleID: $bibleID, ')
          ..write('bookID: $bookID')
          ..write(')'))
        .toString();
  }
}

class $BibleBooksTable extends BibleBooks
    with TableInfo<$BibleBooksTable, BibleBookDB> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BibleBooksTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _bibleIDMeta = const VerificationMeta('bibleID');
  @override
  late final GeneratedColumn<int> bibleID = GeneratedColumn<int>(
      'bible_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES "bibles" ("id")');
  final VerificationMeta _bookIDMeta = const VerificationMeta('bookID');
  @override
  late final GeneratedColumn<int> bookID = GeneratedColumn<int>(
      'book_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES "books" ("id")');
  @override
  List<GeneratedColumn> get $columns => [id, bibleID, bookID];
  @override
  String get aliasedName => _alias ?? 'bible_books';
  @override
  String get actualTableName => 'bible_books';
  @override
  VerificationContext validateIntegrity(Insertable<BibleBookDB> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bible_i_d')) {
      context.handle(_bibleIDMeta,
          bibleID.isAcceptableOrUnknown(data['bible_i_d']!, _bibleIDMeta));
    } else if (isInserting) {
      context.missing(_bibleIDMeta);
    }
    if (data.containsKey('book_i_d')) {
      context.handle(_bookIDMeta,
          bookID.isAcceptableOrUnknown(data['book_i_d']!, _bookIDMeta));
    } else if (isInserting) {
      context.missing(_bookIDMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BibleBookDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BibleBookDB(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      bibleID: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}bible_i_d'])!,
      bookID: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}book_i_d'])!,
    );
  }

  @override
  $BibleBooksTable createAlias(String alias) {
    return $BibleBooksTable(attachedDatabase, alias);
  }
}

class VerseDB extends DataClass implements Insertable<VerseDB> {
  final int id;
  final int chapter;
  final int verse;
  final String verseText;
  const VerseDB(
      {required this.id,
      required this.chapter,
      required this.verse,
      required this.verseText});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['chapter'] = Variable<int>(chapter);
    map['verse'] = Variable<int>(verse);
    map['verse_text'] = Variable<String>(verseText);
    return map;
  }

  VersesCompanion toCompanion(bool nullToAbsent) {
    return VersesCompanion(
      id: Value(id),
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
      'chapter': serializer.toJson<int>(chapter),
      'verse': serializer.toJson<int>(verse),
      'verseText': serializer.toJson<String>(verseText),
    };
  }

  VerseDB copyWith({int? id, int? chapter, int? verse, String? verseText}) =>
      VerseDB(
        id: id ?? this.id,
        chapter: chapter ?? this.chapter,
        verse: verse ?? this.verse,
        verseText: verseText ?? this.verseText,
      );
  @override
  String toString() {
    return (StringBuffer('VerseDB(')
          ..write('id: $id, ')
          ..write('chapter: $chapter, ')
          ..write('verse: $verse, ')
          ..write('verseText: $verseText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, chapter, verse, verseText);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VerseDB &&
          other.id == this.id &&
          other.chapter == this.chapter &&
          other.verse == this.verse &&
          other.verseText == this.verseText);
}

class VersesCompanion extends UpdateCompanion<VerseDB> {
  final Value<int> id;
  final Value<int> chapter;
  final Value<int> verse;
  final Value<String> verseText;
  const VersesCompanion({
    this.id = const Value.absent(),
    this.chapter = const Value.absent(),
    this.verse = const Value.absent(),
    this.verseText = const Value.absent(),
  });
  VersesCompanion.insert({
    this.id = const Value.absent(),
    this.chapter = const Value.absent(),
    this.verse = const Value.absent(),
    this.verseText = const Value.absent(),
  });
  static Insertable<VerseDB> custom({
    Expression<int>? id,
    Expression<int>? chapter,
    Expression<int>? verse,
    Expression<String>? verseText,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chapter != null) 'chapter': chapter,
      if (verse != null) 'verse': verse,
      if (verseText != null) 'verse_text': verseText,
    });
  }

  VersesCompanion copyWith(
      {Value<int>? id,
      Value<int>? chapter,
      Value<int>? verse,
      Value<String>? verseText}) {
    return VersesCompanion(
      id: id ?? this.id,
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
  List<GeneratedColumn> get $columns => [id, chapter, verse, verseText];
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

class BookVerseDB extends DataClass implements Insertable<BookVerseDB> {
  final int id;
  final int bookID;
  final int verseID;
  const BookVerseDB(
      {required this.id, required this.bookID, required this.verseID});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['book_i_d'] = Variable<int>(bookID);
    map['verse_i_d'] = Variable<int>(verseID);
    return map;
  }

  BookVersesCompanion toCompanion(bool nullToAbsent) {
    return BookVersesCompanion(
      id: Value(id),
      bookID: Value(bookID),
      verseID: Value(verseID),
    );
  }

  factory BookVerseDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookVerseDB(
      id: serializer.fromJson<int>(json['id']),
      bookID: serializer.fromJson<int>(json['bookID']),
      verseID: serializer.fromJson<int>(json['verseID']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bookID': serializer.toJson<int>(bookID),
      'verseID': serializer.toJson<int>(verseID),
    };
  }

  BookVerseDB copyWith({int? id, int? bookID, int? verseID}) => BookVerseDB(
        id: id ?? this.id,
        bookID: bookID ?? this.bookID,
        verseID: verseID ?? this.verseID,
      );
  @override
  String toString() {
    return (StringBuffer('BookVerseDB(')
          ..write('id: $id, ')
          ..write('bookID: $bookID, ')
          ..write('verseID: $verseID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, bookID, verseID);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookVerseDB &&
          other.id == this.id &&
          other.bookID == this.bookID &&
          other.verseID == this.verseID);
}

class BookVersesCompanion extends UpdateCompanion<BookVerseDB> {
  final Value<int> id;
  final Value<int> bookID;
  final Value<int> verseID;
  const BookVersesCompanion({
    this.id = const Value.absent(),
    this.bookID = const Value.absent(),
    this.verseID = const Value.absent(),
  });
  BookVersesCompanion.insert({
    this.id = const Value.absent(),
    required int bookID,
    required int verseID,
  })  : bookID = Value(bookID),
        verseID = Value(verseID);
  static Insertable<BookVerseDB> custom({
    Expression<int>? id,
    Expression<int>? bookID,
    Expression<int>? verseID,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bookID != null) 'book_i_d': bookID,
      if (verseID != null) 'verse_i_d': verseID,
    });
  }

  BookVersesCompanion copyWith(
      {Value<int>? id, Value<int>? bookID, Value<int>? verseID}) {
    return BookVersesCompanion(
      id: id ?? this.id,
      bookID: bookID ?? this.bookID,
      verseID: verseID ?? this.verseID,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (bookID.present) {
      map['book_i_d'] = Variable<int>(bookID.value);
    }
    if (verseID.present) {
      map['verse_i_d'] = Variable<int>(verseID.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookVersesCompanion(')
          ..write('id: $id, ')
          ..write('bookID: $bookID, ')
          ..write('verseID: $verseID')
          ..write(')'))
        .toString();
  }
}

class $BookVersesTable extends BookVerses
    with TableInfo<$BookVersesTable, BookVerseDB> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookVersesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _bookIDMeta = const VerificationMeta('bookID');
  @override
  late final GeneratedColumn<int> bookID = GeneratedColumn<int>(
      'book_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES "books" ("id")');
  final VerificationMeta _verseIDMeta = const VerificationMeta('verseID');
  @override
  late final GeneratedColumn<int> verseID = GeneratedColumn<int>(
      'verse_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES "verses" ("id")');
  @override
  List<GeneratedColumn> get $columns => [id, bookID, verseID];
  @override
  String get aliasedName => _alias ?? 'book_verses';
  @override
  String get actualTableName => 'book_verses';
  @override
  VerificationContext validateIntegrity(Insertable<BookVerseDB> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('book_i_d')) {
      context.handle(_bookIDMeta,
          bookID.isAcceptableOrUnknown(data['book_i_d']!, _bookIDMeta));
    } else if (isInserting) {
      context.missing(_bookIDMeta);
    }
    if (data.containsKey('verse_i_d')) {
      context.handle(_verseIDMeta,
          verseID.isAcceptableOrUnknown(data['verse_i_d']!, _verseIDMeta));
    } else if (isInserting) {
      context.missing(_verseIDMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookVerseDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookVerseDB(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      bookID: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}book_i_d'])!,
      verseID: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}verse_i_d'])!,
    );
  }

  @override
  $BookVersesTable createAlias(String alias) {
    return $BookVersesTable(attachedDatabase, alias);
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
  late final $BibleBooksTable bibleBooks = $BibleBooksTable(this);
  late final $VersesTable verses = $VersesTable(this);
  late final $BookVersesTable bookVerses = $BookVersesTable(this);
  late final $PrayersTable prayers = $PrayersTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [settings, bibles, books, bibleBooks, verses, bookVerses, prayers];
}
