import 'package:drift/drift.dart';
import 'package:verse_prayer_study/models/settingsData.dart';

part 'database.g.dart';

@DataClassName('SettingsDB')
class Settings extends Table {
  IntColumn get id =>
      integer().autoIncrement().withDefault(const Constant(1))();
  IntColumn get theme => integer().withDefault(const Constant(0))();
  IntColumn get color => integer().withDefault(const Constant(0xFF000000))();
  BoolColumn get darkmode => boolean().withDefault(const Constant(false))();
}

@DataClassName('BibleDB')
class Bibles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get language => text()();
  TextColumn get name => text()();
  TextColumn get abr => text()();
}

@DataClassName('BibleBookDB')
class BibleBooks extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get bibleID => integer().references(Bibles, #id)();
  IntColumn get bookID => integer().references(Books, #id)();
}

@DataClassName('BookDB')
class Books extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withDefault(const Constant(''))();
}

@DataClassName('BookVerseDB')
class BookVerses extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get bookID => integer().references(Books, #id)();
  IntColumn get verseID => integer().references(Verses, #id)();
}

@DataClassName('VerseDB')
class Verses extends Table {
  // PrimaryKey
  IntColumn get id => integer().autoIncrement()();

  //chapter
  IntColumn get chapter => integer().withDefault(const Constant(0))();
  //verse
  IntColumn get verse => integer().withDefault(const Constant(0))();
  //text
  TextColumn get verseText => text().withDefault(const Constant(''))();
}

// Data
@DataClassName('PrayerDB')
class Prayers extends Table {
  // PrimaryKey
  IntColumn get id => integer().autoIncrement()();
  //name
  TextColumn get name => text()();
  //text
  TextColumn get prayerText => text()();
}

// @DataClassName('BookVerseDB')
// class BookVerse extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   IntColumn get book => integer().references(Books, #id)();
//   IntColumn get verse => integer().references(Verses, #id)();
// }

// @DataClassName('AlbumSongDataDB')
// class AlbumSongs extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   IntColumn get album => integer().references(Albums, #id)();
//   IntColumn get song => integer().references(Songs, #id)();
// }

// //streams
// @DataClassName('StreamDataDB')
// class Streams extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get name => text().withLength(min: 0, max: 128)();
//   TextColumn get description =>
//       text().withLength(min: 0, max: 1024).withDefault(const Constant(''))();
//   TextColumn get streamURL =>
//       text().withLength(min: 0, max: 1024).withDefault(const Constant(''))();
// }

@DriftDatabase(tables: [
  Settings,
  Bibles,
  BibleBooks,
  Books,
  BookVerses,
  Verses,
  Prayers,
])
class SharedDatabase extends _$SharedDatabase {
  // we tell the database where to store the data with this constructor
  SharedDatabase(QueryExecutor e) : super(e);

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;

  Future<SettingsDB?> getSettings() async {
    //print('Getting Home State');
    return await (select(settings)
          ..where((tbl) => tbl.id.equals(1))
          ..limit(1))
        .getSingleOrNull();
  }

  Future<int> setSettings(SettingsDB state) async {
    //print('Saving Home State');
    return into(settings).insertOnConflictUpdate(state);
  }

  // //songs
  // Future<bool> songExists(int id) async {
  //   if (id < 0) {
  //     return false;
  //   }
  //   var count = countAll(filter: songs.id.equals(id));
  //   var res = await (selectOnly(songs)..addColumns([count]))
  //       .map((row) => row.read(count))
  //       .getSingle();
  //   if (res > 0) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // Future<SongDataDB?> getSongData(int id) async {
  //   return await (select(songs)
  //         ..where((tbl) => tbl.id.equals(id))
  //         ..limit(1))
  //       .getSingleOrNull();
  // }

  // Future<int> setSongData(SongsCompanion song) async {
  //   return into(songs).insertOnConflictUpdate(song);
  // }

  // Future<bool> updateSongData(SongDataDB song) async {
  //   return update(songs).replace(song);
  // }

  // Future<int> delSongData(SongDataDB song) async {
  //   print('deleting ${song.title}, index ${song.id}');
  //   return (delete(songs)..where((s) => s.id.equals(song.id))).go();
  //   //remove file?
  // }

  // Future<List<SongDataDB>> getAllSongs() async {
  //   return await (select(songs)
  //         ..orderBy([(t) => OrderingTerm(expression: t.title)]))
  //       .get();
  // }

  // //playlists
  // Future<bool> playlistExists(int id) async {
  //   if (id < 0) {
  //     return false;
  //   }
  //   var count = countAll(filter: playlists.id.equals(id));
  //   var res = await (selectOnly(playlists)..addColumns([count]))
  //       .map((row) => row.read(count))
  //       .getSingle();
  //   if (res > 0) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // Future<int> setPlaylistData(PlaylistsCompanion companion) async {
  //   int newId = await into(playlists).insertOnConflictUpdate(companion);
  //   print('new id: $newId');
  //   //PlaylistsCompanion.insert(name: )
  //   return newId;
  // }

  // Future<bool> updatePlaylistData(PlaylistDataDB playlist) async {
  //   return await update(playlists).replace(playlist);
  // }

  // Future<int> delPlaylistData(PlaylistDataDB playlist) async {
  //   print('deleting ${playlist.title}, index ${playlist.id}');
  //   return await (delete(playlists)..where((p) => p.id.equals(playlist.id)))
  //       .go();
  // }

  // Future<int> addPlaylistSong(PlaylistDataDB playlist, SongDataDB song) async {
  //   PlaylistSongsCompanion entry = PlaylistSongsCompanion(
  //     playlist: Value(playlist.id),
  //     song: Value(song.id),
  //   );
  //   return await into(playlistSongs).insert(entry);
  // }

  // Future delPlaylistSong(PlaylistDataDB playlist, SongDataDB song) async {
  //   final firstSongID = selectOnly(playlistSongs)
  //     ..addColumns([playlistSongs.id])
  //     ..where(playlistSongs.playlist.equals(playlist.id) &
  //         playlistSongs.song.equals(song.id));
  //   return await (delete(playlistSongs)
  //         ..where((e) => e.id.equalsExp(subqueryExpression(firstSongID))))
  //       .go();
  // }

  // Future<List<SongDataDB>> getPlaylistSongs(PlaylistData playlist) async {
  //   // var playlistQuery = select(playlists)
  //   //   ..where((tbl) => tbl.id.equals(playlist.id));
  //   //get songs from playlist
  //   final songsQuery = await (select(playlistSongs).join(
  //     [
  //       innerJoin(
  //         songs,
  //         songs.id.equalsExp(playlistSongs.song),
  //       ),
  //     ],
  //   )..where(playlistSongs.playlist.equals(playlist.id)))
  //       .get();

  //   var songsList = songsQuery.map((result) {
  //     return result.readTable(songs);
  //   }).toList();
  //   print('got ${songsList.length} songs in playlist');
  //   return songsList;
  // }

  // Future<List<PlaylistDataDB>> getAllPlaylists() async {
  //   return await (select(playlists)
  //         ..orderBy([(t) => OrderingTerm(expression: t.title)]))
  //       .get();
  // }

  // //albums
  // Future<bool> albumExists(int id) async {
  //   if (id < 0) {
  //     return false;
  //   }
  //   var count = countAll(filter: albums.id.equals(id));
  //   var res = await (selectOnly(albums)..addColumns([count]))
  //       .map((row) => row.read(count))
  //       .getSingle();
  //   if (res > 0) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // Future<int> setAlbumData(AlbumsCompanion companion) async {
  //   int newId = await into(albums).insertOnConflictUpdate(companion);
  //   print('new id: $newId');
  //   //PlaylistsCompanion.insert(name: )
  //   return newId;
  // }

  // Future<bool> updateAlbumData(AlbumDataDB album) async {
  //   return await update(albums).replace(album);
  // }

  // Future<int> delAlbumData(AlbumDataDB album) async {
  //   print('deleting ${album.title}, index ${album.id}');
  //   return await (delete(albums)..where((p) => p.id.equals(album.id))).go();
  // }

  // Future<int> addAlbumSong(AlbumDataDB album, SongDataDB song) async {
  //   AlbumSongsCompanion entry = AlbumSongsCompanion(
  //     album: Value(album.id),
  //     song: Value(song.id),
  //   );
  //   return await into(albumSongs).insert(entry);
  // }

  // Future<int> delAlbumSong(AlbumDataDB album, SongDataDB song) async {
  //   final firstSongID = selectOnly(albumSongs)
  //     ..addColumns([albumSongs.id])
  //     ..where(
  //         albumSongs.album.equals(album.id) & albumSongs.song.equals(song.id));
  //   return await (delete(albumSongs)
  //         ..where((e) => e.id.equalsExp(subqueryExpression(firstSongID))))
  //       .go();
  // }

  // Future<List<SongDataDB>> getAlbumSongs(AlbumData album) async {
  //   // var playlistQuery = select(playlists)
  //   //   ..where((tbl) => tbl.id.equals(playlist.id));
  //   //get songs from playlist
  //   final songsQuery = await (select(albumSongs).join(
  //     [
  //       innerJoin(
  //         songs,
  //         songs.id.equalsExp(albumSongs.song),
  //       ),
  //     ],
  //   )..where(albumSongs.album.equals(album.id)))
  //       .get();

  //   var songsList = songsQuery.map((result) {
  //     return result.readTable(songs);
  //   }).toList();
  //   print('got ${songsList.length} songs in playlist');
  //   return songsList;
  // }

  // Future<List<AlbumDataDB>> getAllAlbums() async {
  //   return await (select(albums)
  //         ..orderBy([(t) => OrderingTerm(expression: t.title)]))
  //       .get();
  // }
}
