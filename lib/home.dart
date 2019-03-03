import 'package:flutter/material.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'dart:core';

import './drawer.dart';
import './songList.dart';
import './lyricstab.dart';
import './song.dart';
import './songProvider.dart';

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

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List<Song> _songs = [];

  @override
  void didUpdateWidget(Home oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('Home Widget Updated');
  }

  @override
  void initState() {
    super.initState();
    _getSongFromDatabase();
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
    print(songs);
    if (songs == null) {
      print('getting songs from directory');
      await _getSongFromDirectory();
    } else {
      print('setting state from database');
      setState(() {
        _songs = songs;
      });
      provider.close();
    }
  }

  dynamic _findInExternalStorage() async {
    Directory baseDir = await getExternalStorageDirectory();
    List<FileSystemEntity> _files =
        baseDir.listSync(recursive: true, followLinks: false);

    print('getting songs from storage');
    List<FileSystemEntity> cont = [];
    cont = await compute(_getSongs, ({'files': _files, 'cont': cont}));
    return cont;
  }

  Future _getSongFromDirectory() async {
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
          setState(() {
            _songs = songs;
          });
        }
      } else {
        List<FileSystemEntity> res = await _findInExternalStorage();
        res.forEach((file) {
          Song.fromFileTodb(file, provider);
        });
        // provider.insertMultiple(songs);
        List<Song> songs = await provider.getAllSong();
        setState(() {
          _songs = songs;
        });
      }
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
              onPressed: _getSongFromDirectory,
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
            SongListTab(_songs),
            LyricsTab(),
          ],
        ),
      ),
    );
  }
}
