import 'package:dart_tags/dart_tags.dart';
import 'dart:typed_data';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

import './songProvider.dart';

final String tableSong = 'songs';
final String columnId = '_id';
final String columnPath = 'path';
final String columnTitle = 'title';
final String columnArtist = 'artist';
final String columnAlbum = 'album';
final String columnLyrics = 'lyrics';
final String columnImageData = 'image';

class Song {
  String path;
  String title;
  String artist;
  String album;
  String lyrics;
  Uint8List imageData;
  int id;

  Song();

  retrieveMetaData(FileSystemEntity file) async {
    var meta;
    try {
      meta = await new TagProcessor()
          .getTagsFromByteArray((file as File).readAsBytes());
    } catch (e) {
      return null;
    }
    return meta[1].tags;
  }

  Song.fromFile(FileSystemEntity file) {
    path = file.path;
    retrieveMetaData(file).then((tags) {
      title = tags['title'] != null ? tags['title'] : 'undefined';
      album = tags['album'];
      artist = tags['artist'];
      lyrics = tags['lyrics'];
      imageData = tags['APIC'] != null
          ? Uint8List.fromList(tags['APIC'].imageData)
          : null;
    });
  }

  Song.fromFileTodb(FileSystemEntity file, SongProvider provider) {
    path = file.path;
    retrieveMetaData(file).then((tags) {
      title = tags['title'];
      album = tags['album'];
      artist = tags['artist'];
      lyrics = tags['lyrics'];
      imageData = tags['APIC'] != null
          ? Uint8List.fromList(tags['APIC'].imageData)
          : null;
      provider.insert(this);
    });
  }

  Song.fromMap(Map<String, dynamic> map) {
    path = map[columnPath];
    title = map[columnTitle];
    artist = map[columnArtist];
    album = map[columnAlbum];
    lyrics = map[columnLyrics];
    imageData = map[columnImageData];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map[columnPath] = path;
    map[columnTitle] = title;
    map[columnAlbum] = album;
    map[columnArtist] = artist;
    map[columnLyrics] = lyrics;
    map[columnImageData] = imageData;
    return map;
  }

  @override
  String toString() {
    return this.toMap().toString();
  }
}
