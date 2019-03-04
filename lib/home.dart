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
import './util.dart';

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
    _audioManager = AudioManager(_songs, new AudioPlayer());
  }

  void _checkPermission() {
    if (Platform.isAndroid) {
      SimplePermissions.checkPermission(Permission.WriteExternalStorage)
          .then((chekOkay) {
        if (!chekOkay) {
          SimplePermissions.requestPermission(Permission.WriteExternalStorage)
              .then((okDone) {
            setState(() {
              persmissionStatus = okDone;
            });
          });
        } else {
          setState(() {
            persmissionStatus = PermissionStatus.authorized;
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
      await _getSongFromStorage(provider);
    } else {
      setState(() {
        _songs = songs;
        _audioManager.songs = _songs;
      });
    }
    provider.close();
  }

  _getSongFromStorage(SongProvider provider) async {
    List<String> localSongs = await LocalStorage.getLocalSongs();
    provider.deleteAll();
    for (var i = 0; i < localSongs.length; i++) {
      var song = Song();
      await song.saveFromFileTodb(
          File.fromUri(Uri(path: localSongs[i])), provider);
    }
    List<Song> _newSongs = await provider.getAllSong();
    setState(() {
      _songs = _newSongs;
      _audioManager.songs = _songs;
    });
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
                var databasesPath = await getDatabasesPath();
                String path = databasesPath + 'demo.db';
                SongProvider provider = new SongProvider();
                await provider.open(path);
                await _getSongFromStorage(provider);
                provider.close();
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
