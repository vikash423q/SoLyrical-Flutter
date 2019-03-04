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


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List<Song> _songs = [];
  AudioManager _audioManager;
  PermissionStatus persmissionStatus;

  @override
  void didUpdateWidget(Home oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    _checkPermission();
    _getSongFromDatabase();
    _audioManager = AudioManager(_songs,new AudioPlayer());
  }

  void _checkPermission(){
    if (Platform.isAndroid) {
      SimplePermissions.checkPermission(Permission.WriteExternalStorage).then((chekOkay){
        if (!chekOkay) {
          SimplePermissions.requestPermission(Permission.WriteExternalStorage).then((okDone){
            setState(() {
              persmissionStatus=okDone;
            });
          });
        } else{
          setState(() {
            persmissionStatus=PermissionStatus.authorized;
          });
        }
      });
    }
  }


  void _getSongFromDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + 'demo.db';
    SongProvider provider = SongProvider();
    await provider.open(path);
    var deleteCount = provider.deleteAll();
    print('Deleting All');
    print(await deleteCount);
    List<Song> songs = await provider.getAllSong();
    if (songs == null) {
      bool permission = persmissionStatus == PermissionStatus.authorized ? true : false;
      await _getSongFromDirectory(permission);
    } else {
      setState(() {
        _songs = songs;
        _audioManager.songs=_songs;
      });
    }
    provider.close();
  }

  dynamic _findInExternalStorage() async {
  Directory baseDir = await getExternalStorageDirectory();
  List<FileSystemEntity> _files =
      baseDir.listSync(recursive: true, followLinks: false);

  List<FileSystemEntity> cont = [];
  cont = await compute(_getSongs,({'files': _files, 'cont': cont}));
  return cont;
}

dynamic _getSongFromDirectory(bool permission) async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + 'demo.db';
    SongProvider provider = SongProvider();
    await provider.open(path);
    if(permission){
        List<FileSystemEntity> res = await _findInExternalStorage();

        await provider.deleteAll();
        for(var i=0;i<res.length;i++){
          Song song = new Song();
          await song.saveFromFileTodb(res[i], provider);
          print('saving to db');
        }
        // provider.insertMultiple(songs);
        print('getting from db');
        List<Song> songs = await provider.getAllSong();

        setState(() {
          _songs=songs;
          _audioManager.songs=songs;
        });
        provider.close();
        return songs;
      }
    provider.close();
  return null;
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
                bool permission = persmissionStatus == PermissionStatus.authorized ? true : false;
                await _getSongFromDirectory(permission);
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
            SongListTab(_songs, _audioManager),
            LyricsTab(),
          ],
        ),
      ),
    );
  }
}
