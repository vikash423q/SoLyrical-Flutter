import 'package:flutter/material.dart';

import './songList.dart';
import './lyricstab.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('So Lyrical'),
          actions: <Widget>[
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
            SongListTab(),
            LyricsTab(),
          ],
        ),
      ),
    );
  }
}
