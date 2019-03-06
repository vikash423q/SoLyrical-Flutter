import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';

import './controller.dart';
import './song.dart';
import './audioManager.dart';

class SongListTab extends StatelessWidget {
  final List<Song> _songs;
  final AudioManager audioManager;
  SongListTab(this._songs, this.audioManager);

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
                title: Text(song.title != null ? song.title : ''),
                subtitle: Text(song.artist != null
                    ? song.artist
                    : (song.album != null ? song.album : '')),
                dense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                onTap: () async {
                  if (audioManager.playingNow == song) {
                    if (audioManager.playerState == AudioPlayerState.PLAYING)
                      return await audioManager.pause();
                    if (audioManager.playerState == AudioPlayerState.PAUSED)
                      return await audioManager.play(song);
                  }
                  if (audioManager.playerState == AudioPlayerState.PLAYING ||
                      audioManager.playerState == AudioPlayerState.PAUSED)
                    await audioManager.stop();
                  audioManager.play(song);
                },
              );
            },
            itemCount: _songs.length,
          ),
        ),
        Controller(audioManager),
      ],
    );
  }
}
