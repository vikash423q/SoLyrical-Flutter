import 'package:flutter/material.dart';
import 'dart:typed_data';

import './controller.dart';
import './song.dart';

class SongListTab extends StatelessWidget {
  final List<Song> _songs;
  SongListTab(this._songs);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              var song = _songs[index];
              return ListTile(
                leading: (song.imageData == null
                    ? Image.asset(
                        'assets/logo.png',
                        height: 50,
                        width: 50,
                      )
                    : Image.memory(
                        song.imageData,
                        height: 50,
                        width: 50,
                      )),
                title: Text(song.title),
                subtitle: Text(song.artist != null ? song.artist : ''),
                dense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                onTap: () {
                  print('$song');
                },
              );
            },
            itemCount: _songs.length,
          ),
        ),
        Controller(),
      ],
    );
  }
}
