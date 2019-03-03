import 'package:sqflite/sqflite.dart';

import './song.dart';

final String tableSong = 'songs';
final String columnId = '_id';
final String columnPath = 'path';
final String columnTitle = 'title';
final String columnArtist = 'artist';
final String columnAlbum = 'album';
final String columnLyrics = 'lyrics';
final String columnImageData = 'image';

class SongProvider {
  Database db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
  create table $tableSong ( 
  $columnId integer primary key autoincrement, 
  $columnPath text,
  $columnTitle text,
  $columnAlbum text,
  $columnLyrics text,
  $columnArtist text,
  $columnImageData blob)
  ''');
    });
  }

  Future<Song> insert(Song song) async {
    song.id = await db.insert(tableSong, song.toMap());
    return song;
  }

  Future<dynamic> insertMultiple(List<Song> songs) async {
    var results;
    await db.transaction((txn) async {
      var batch = txn.batch();
      songs.forEach((item) {
        batch.insert(tableSong, {
          columnTitle: item.title,
          columnArtist: item.artist,
          columnAlbum: item.album,
          columnPath: item.path,
          columnImageData: item.imageData,
          columnId: item.id,
          columnLyrics: item.lyrics
        });
      });
      results = await batch.commit();
    });

    return results;
  }

  Future<List<Song>> getAllSong() async {
    List<Map> maps = await db.query(tableSong, columns: [
      columnId,
      columnPath,
      columnTitle,
      columnAlbum,
      columnArtist,
      columnLyrics,
      columnImageData
    ]);
    if (maps.length > 0) {
      List<Song> songs = [];
      maps.forEach((item) => songs.add(Song.fromMap(item)));
      return songs;
    }
    return null;
  }

  Future<Song> getSong(int id) async {
    List<Map> maps = await db.query(tableSong,
        columns: [
          columnId,
          columnPath,
          columnTitle,
          columnAlbum,
          columnArtist,
          columnLyrics,
          columnImageData
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Song.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableSong, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> deleteAll() async {
    return await db.delete(tableSong);
  }

  Future<int> update(Song song) async {
    return await db.update(tableSong, song.toMap(),
        where: '$columnId = ?', whereArgs: [song.id]);
  }

  Future close() async => db.close();
}
