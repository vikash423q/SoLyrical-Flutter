import 'package:flutter/material.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:audioplayer/audioplayer.dart';
import 'dart:io';
import 'dart:core';

import './drawer.dart';
import './songList.dart';
import './lyricstab.dart';
import './song.dart';
import './songProvider.dart';
import './audioManager.dart';

List<FileSystemEntity> _getSongs(Map<String, dynamic> map) {
  map['files'].forEach((entity) {
    if (entity is Directory) {
      List<FileSystemEntity> _list =
          entity.listSync(recursive: true, followLinks: false);
      _getSongs({'files': _list, 'cont': map['cont']});
    }
    if (entity is File) {
      if (entity.path.endsWith('.mp3') && !entity.path.contains('/.')) {
        map['cont'].add(entity);
      }
    }
  });
  return map['cont'];
}

dynamic _findInExternalStorage() async {
  Directory baseDir = await getExternalStorageDirectory();
  List<FileSystemEntity> _files =
      baseDir.listSync(recursive: true, followLinks: false);

  print('getting songs from storage');
  List<FileSystemEntity> cont = [];
  cont = _getSongs({'files': _files, 'cont': cont});
  return cont;
}

Future<List<Song>> _getSongFromDirectory(String str) async {
  print('getting songs from directory');
  if (Platform.isAndroid) {
    var chekOkay = await SimplePermissions.checkPermission(
        Permission.WriteExternalStorage);
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + 'demo.db';
    SongProvider provider = SongProvider();
    await provider.open(path);
    if (!chekOkay) {
      var okDone = await SimplePermissions.requestPermission(
          Permission.WriteExternalStorage);
      if (okDone == PermissionStatus.authorized) {
        List<FileSystemEntity> res = await _findInExternalStorage();
        res.forEach((file) {
          Song.fromFileTodb(file, provider);
        });
        // provider.insertMultiple(songs);
        List<Song> songs = await provider.getAllSong();
        return songs;
      }
    } else {
      List<FileSystemEntity> res = await _findInExternalStorage();
      res.forEach((file) {
        Song.fromFileTodb(file, provider);
      });
      // provider.insertMultiple(songs);
      List<Song> songs = await provider.getAllSong();
      return songs;
    }
    provider.close();
  }
  return null;
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List<Song> _songs = [];
  AudioManager audioManager;

  @override
  void didUpdateWidget(Home oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('Home Widget Updated');
  }

  @override
  void initState() {
    super.initState();
    _getSongFromDatabase();
    audioManager = AudioManager(new AudioPlayer());
  }

  void _getSongFromDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + 'demo.db';
    SongProvider provider = SongProvider();
    await provider.open(path);
    // var deleteCount = provider.deleteAll();
    // print('Deleting All');
    // print(deleteCount);
    print('getting from database');
    List<Song> songs = await provider.getAllSong();
    if (songs == null) {
      print('getting songs from directory');
      var res = await compute(_getSongFromDirectory, '');
      var newSongs = await res;
      setState(() {
        _songs = newSongs;
      });
    } else {
      print('setting state from database');
      setState(() {
        _songs = songs;
      });
      provider.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    print('rendering Home');
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text('So Lyrical'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () async {
                var res = await compute(_getSongFromDirectory, '');
                var songs = await res;
                print(songs);
                setState(() {
                  _songs = songs;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('search button pressed');
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.library_music),
                text: 'Music',
              ),
              Tab(icon: Icon(Icons.music_note), text: 'Lyrics'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SongListTab(_songs, audioManager),
            LyricsTab(),
          ],
        ),
      ),
    );
  }
}
