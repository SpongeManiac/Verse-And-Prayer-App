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
  final int bible;
  final int book;
  const BibleBookDB(
      {required this.id, required this.bible, required this.book});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bible'] = Variable<int>(bible);
    map['book'] = Variable<int>(book);
    return map;
  }

  BibleBooksCompanion toCompanion(bool nullToAbsent) {
    return BibleBooksCompanion(
      id: Value(id),
      bible: Value(bible),
      book: Value(book),
    );
  }

  factory BibleBookDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BibleBookDB(
      id: serializer.fromJson<int>(json['id']),
      bible: serializer.fromJson<int>(json['bible']),
      book: serializer.fromJson<int>(json['book']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bible': serializer.toJson<int>(bible),
      'book': serializer.toJson<int>(book),
    };
  }

  BibleBookDB copyWith({int? id, int? bible, int? book}) => BibleBookDB(
        id: id ?? this.id,
        bible: bible ?? this.bible,
        book: book ?? this.book,
      );
  @override
  String toString() {
    return (StringBuffer('BibleBookDB(')
          ..write('id: $id, ')
          ..write('bible: $bible, ')
          ..write('book: $book')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, bible, book);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BibleBookDB &&
          other.id == this.id &&
          other.bible == this.bible &&
          other.book == this.book);
}

class BibleBooksCompanion extends UpdateCompanion<BibleBookDB> {
  final Value<int> id;
  final Value<int> bible;
  final Value<int> book;
  const BibleBooksCompanion({
    this.id = const Value.absent(),
    this.bible = const Value.absent(),
    this.book = const Value.absent(),
  });
  BibleBooksCompanion.insert({
    this.id = const Value.absent(),
    required int bible,
    required int book,
  })  : bible = Value(bible),
        book = Value(book);
  static Insertable<BibleBookDB> custom({
    Expression<int>? id,
    Expression<int>? bible,
    Expression<int>? book,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bible != null) 'bible': bible,
      if (book != null) 'book': book,
    });
  }

  BibleBooksCompanion copyWith(
      {Value<int>? id, Value<int>? bible, Value<int>? book}) {
    return BibleBooksCompanion(
      id: id ?? this.id,
      bible: bible ?? this.bible,
      book: book ?? this.book,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (bible.present) {
      map['bible'] = Variable<int>(bible.value);
    }
    if (book.present) {
      map['book'] = Variable<int>(book.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BibleBooksCompanion(')
          ..write('id: $id, ')
          ..write('bible: $bible, ')
          ..write('book: $book')
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
  final VerificationMeta _bibleMeta = const VerificationMeta('bible');
  @override
  late final GeneratedColumn<int> bible = GeneratedColumn<int>(
      'bible', aliasedName, false,
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
  @override
  List<GeneratedColumn> get $columns => [id, bible, book];
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
    if (data.containsKey('bible')) {
      context.handle(
          _bibleMeta, bible.isAcceptableOrUnknown(data['bible']!, _bibleMeta));
    } else if (isInserting) {
      context.missing(_bibleMeta);
    }
    if (data.containsKey('book')) {
      context.handle(
          _bookMeta, book.isAcceptableOrUnknown(data['book']!, _bookMeta));
    } else if (isInserting) {
      context.missing(_bookMeta);
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
      bible: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}bible'])!,
      book: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}book'])!,
    );
  }

  @override
  $BibleBooksTable createAlias(String alias) {
    return $BibleBooksTable(attachedDatabase, alias);
  }
}

class VerseDB extends DataClass implements Insertable<VerseDB> {
  final int id;
  final int book;
  final int chapter;
  final int verse;
  final String scripture;
  const VerseDB(
      {required this.id,
      required this.book,
      required this.chapter,
      required this.verse,
      required this.scripture});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['book'] = Variable<int>(book);
    map['chapter'] = Variable<int>(chapter);
    map['verse'] = Variable<int>(verse);
    map['scripture'] = Variable<String>(scripture);
    return map;
  }

  VersesCompanion toCompanion(bool nullToAbsent) {
    return VersesCompanion(
      id: Value(id),
      book: Value(book),
      chapter: Value(chapter),
      verse: Value(verse),
      scripture: Value(scripture),
    );
  }

  factory VerseDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VerseDB(
      id: serializer.fromJson<int>(json['id']),
      book: serializer.fromJson<int>(json['book']),
      chapter: serializer.fromJson<int>(json['chapter']),
      verse: serializer.fromJson<int>(json['verse']),
      scripture: serializer.fromJson<String>(json['scripture']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'book': serializer.toJson<int>(book),
      'chapter': serializer.toJson<int>(chapter),
      'verse': serializer.toJson<int>(verse),
      'scripture': serializer.toJson<String>(scripture),
    };
  }

  VerseDB copyWith(
          {int? id, int? book, int? chapter, int? verse, String? scripture}) =>
      VerseDB(
        id: id ?? this.id,
        book: book ?? this.book,
        chapter: chapter ?? this.chapter,
        verse: verse ?? this.verse,
        scripture: scripture ?? this.scripture,
      );
  @override
  String toString() {
    return (StringBuffer('VerseDB(')
          ..write('id: $id, ')
          ..write('book: $book, ')
          ..write('chapter: $chapter, ')
          ..write('verse: $verse, ')
          ..write('scripture: $scripture')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, book, chapter, verse, scripture);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VerseDB &&
          other.id == this.id &&
          other.book == this.book &&
          other.chapter == this.chapter &&
          other.verse == this.verse &&
          other.scripture == this.scripture);
}

class VersesCompanion extends UpdateCompanion<VerseDB> {
  final Value<int> id;
  final Value<int> book;
  final Value<int> chapter;
  final Value<int> verse;
  final Value<String> scripture;
  const VersesCompanion({
    this.id = const Value.absent(),
    this.book = const Value.absent(),
    this.chapter = const Value.absent(),
    this.verse = const Value.absent(),
    this.scripture = const Value.absent(),
  });
  VersesCompanion.insert({
    this.id = const Value.absent(),
    required int book,
    this.chapter = const Value.absent(),
    this.verse = const Value.absent(),
    this.scripture = const Value.absent(),
  }) : book = Value(book);
  static Insertable<VerseDB> custom({
    Expression<int>? id,
    Expression<int>? book,
    Expression<int>? chapter,
    Expression<int>? verse,
    Expression<String>? scripture,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (book != null) 'book': book,
      if (chapter != null) 'chapter': chapter,
      if (verse != null) 'verse': verse,
      if (scripture != null) 'scripture': scripture,
    });
  }

  VersesCompanion copyWith(
      {Value<int>? id,
      Value<int>? book,
      Value<int>? chapter,
      Value<int>? verse,
      Value<String>? scripture}) {
    return VersesCompanion(
      id: id ?? this.id,
      book: book ?? this.book,
      chapter: chapter ?? this.chapter,
      verse: verse ?? this.verse,
      scripture: scripture ?? this.scripture,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
    if (scripture.present) {
      map['scripture'] = Variable<String>(scripture.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VersesCompanion(')
          ..write('id: $id, ')
          ..write('book: $book, ')
          ..write('chapter: $chapter, ')
          ..write('verse: $verse, ')
          ..write('scripture: $scripture')
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
  final VerificationMeta _scriptureMeta = const VerificationMeta('scripture');
  @override
  late final GeneratedColumn<String> scripture = GeneratedColumn<String>(
      'scripture', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns => [id, book, chapter, verse, scripture];
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
    if (data.containsKey('scripture')) {
      context.handle(_scriptureMeta,
          scripture.isAcceptableOrUnknown(data['scripture']!, _scriptureMeta));
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
      book: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}book'])!,
      chapter: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}chapter'])!,
      verse: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}verse'])!,
      scripture: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}scripture'])!,
    );
  }

  @override
  $VersesTable createAlias(String alias) {
    return $VersesTable(attachedDatabase, alias);
  }
}

class BibleVerseDB extends DataClass implements Insertable<BibleVerseDB> {
  final int id;
  final int bible;
  final int verse;
  const BibleVerseDB(
      {required this.id, required this.bible, required this.verse});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bible'] = Variable<int>(bible);
    map['verse'] = Variable<int>(verse);
    return map;
  }

  BibleVersesCompanion toCompanion(bool nullToAbsent) {
    return BibleVersesCompanion(
      id: Value(id),
      bible: Value(bible),
      verse: Value(verse),
    );
  }

  factory BibleVerseDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BibleVerseDB(
      id: serializer.fromJson<int>(json['id']),
      bible: serializer.fromJson<int>(json['bible']),
      verse: serializer.fromJson<int>(json['verse']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bible': serializer.toJson<int>(bible),
      'verse': serializer.toJson<int>(verse),
    };
  }

  BibleVerseDB copyWith({int? id, int? bible, int? verse}) => BibleVerseDB(
        id: id ?? this.id,
        bible: bible ?? this.bible,
        verse: verse ?? this.verse,
      );
  @override
  String toString() {
    return (StringBuffer('BibleVerseDB(')
          ..write('id: $id, ')
          ..write('bible: $bible, ')
          ..write('verse: $verse')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, bible, verse);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BibleVerseDB &&
          other.id == this.id &&
          other.bible == this.bible &&
          other.verse == this.verse);
}

class BibleVersesCompanion extends UpdateCompanion<BibleVerseDB> {
  final Value<int> id;
  final Value<int> bible;
  final Value<int> verse;
  const BibleVersesCompanion({
    this.id = const Value.absent(),
    this.bible = const Value.absent(),
    this.verse = const Value.absent(),
  });
  BibleVersesCompanion.insert({
    this.id = const Value.absent(),
    required int bible,
    required int verse,
  })  : bible = Value(bible),
        verse = Value(verse);
  static Insertable<BibleVerseDB> custom({
    Expression<int>? id,
    Expression<int>? bible,
    Expression<int>? verse,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bible != null) 'bible': bible,
      if (verse != null) 'verse': verse,
    });
  }

  BibleVersesCompanion copyWith(
      {Value<int>? id, Value<int>? bible, Value<int>? verse}) {
    return BibleVersesCompanion(
      id: id ?? this.id,
      bible: bible ?? this.bible,
      verse: verse ?? this.verse,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (bible.present) {
      map['bible'] = Variable<int>(bible.value);
    }
    if (verse.present) {
      map['verse'] = Variable<int>(verse.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BibleVersesCompanion(')
          ..write('id: $id, ')
          ..write('bible: $bible, ')
          ..write('verse: $verse')
          ..write(')'))
        .toString();
  }
}

class $BibleVersesTable extends BibleVerses
    with TableInfo<$BibleVersesTable, BibleVerseDB> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BibleVersesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _bibleMeta = const VerificationMeta('bible');
  @override
  late final GeneratedColumn<int> bible = GeneratedColumn<int>(
      'bible', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES "bibles" ("id")');
  final VerificationMeta _verseMeta = const VerificationMeta('verse');
  @override
  late final GeneratedColumn<int> verse = GeneratedColumn<int>(
      'verse', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES "verses" ("id")');
  @override
  List<GeneratedColumn> get $columns => [id, bible, verse];
  @override
  String get aliasedName => _alias ?? 'bible_verses';
  @override
  String get actualTableName => 'bible_verses';
  @override
  VerificationContext validateIntegrity(Insertable<BibleVerseDB> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bible')) {
      context.handle(
          _bibleMeta, bible.isAcceptableOrUnknown(data['bible']!, _bibleMeta));
    } else if (isInserting) {
      context.missing(_bibleMeta);
    }
    if (data.containsKey('verse')) {
      context.handle(
          _verseMeta, verse.isAcceptableOrUnknown(data['verse']!, _verseMeta));
    } else if (isInserting) {
      context.missing(_verseMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BibleVerseDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BibleVerseDB(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      bible: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}bible'])!,
      verse: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}verse'])!,
    );
  }

  @override
  $BibleVersesTable createAlias(String alias) {
    return $BibleVersesTable(attachedDatabase, alias);
  }
}

class PrayerDB extends DataClass implements Insertable<PrayerDB> {
  final int id;
  final String name;
  final String prayer;
  const PrayerDB({required this.id, required this.name, required this.prayer});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['prayer'] = Variable<String>(prayer);
    return map;
  }

  PrayersCompanion toCompanion(bool nullToAbsent) {
    return PrayersCompanion(
      id: Value(id),
      name: Value(name),
      prayer: Value(prayer),
    );
  }

  factory PrayerDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrayerDB(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      prayer: serializer.fromJson<String>(json['prayer']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'prayer': serializer.toJson<String>(prayer),
    };
  }

  PrayerDB copyWith({int? id, String? name, String? prayer}) => PrayerDB(
        id: id ?? this.id,
        name: name ?? this.name,
        prayer: prayer ?? this.prayer,
      );
  @override
  String toString() {
    return (StringBuffer('PrayerDB(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('prayer: $prayer')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, prayer);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrayerDB &&
          other.id == this.id &&
          other.name == this.name &&
          other.prayer == this.prayer);
}

class PrayersCompanion extends UpdateCompanion<PrayerDB> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> prayer;
  const PrayersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.prayer = const Value.absent(),
  });
  PrayersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String prayer,
  })  : name = Value(name),
        prayer = Value(prayer);
  static Insertable<PrayerDB> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? prayer,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (prayer != null) 'prayer': prayer,
    });
  }

  PrayersCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? prayer}) {
    return PrayersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      prayer: prayer ?? this.prayer,
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
    if (prayer.present) {
      map['prayer'] = Variable<String>(prayer.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrayersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('prayer: $prayer')
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
  final VerificationMeta _prayerMeta = const VerificationMeta('prayer');
  @override
  late final GeneratedColumn<String> prayer = GeneratedColumn<String>(
      'prayer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, prayer];
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
    if (data.containsKey('prayer')) {
      context.handle(_prayerMeta,
          prayer.isAcceptableOrUnknown(data['prayer']!, _prayerMeta));
    } else if (isInserting) {
      context.missing(_prayerMeta);
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
      prayer: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}prayer'])!,
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
  late final $BibleVersesTable bibleVerses = $BibleVersesTable(this);
  late final $PrayersTable prayers = $PrayersTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [settings, bibles, books, bibleBooks, verses, bibleVerses, prayers];
}
