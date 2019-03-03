import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';

import './songPage.dart';
import './audioManager.dart';

class Controller extends StatelessWidget {
  final AudioManager audioManager;

  Controller(this.audioManager);

  @override
  Widget build(BuildContext context) {
    var song = audioManager.playingNow;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => SongPage(audioManager)));
      },
      child: Container(
        decoration:
            BoxDecoration(color: Colors.deepOrange[400], boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset.zero,
            color: Colors.grey[600],
            blurRadius: 3,
          ),
        ]),
        margin: EdgeInsets.all(0.0),
        child: Container(
          margin: EdgeInsets.all(0.0),
          padding: EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Hero(
                tag: 'song',
                child: song == null || song.imageData == null
                    ? Image.asset(
                        'assets/logo.png',
                        height: 60,
                        width: 60,
                      )
                    : Image.memory(
                        song.imageData,
                        height: 60,
                        width: 60,
                      ),
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                song != null ? (song.title != null ? song.title : '') : '',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              SizedBox(
                width: 8.0,
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      audioManager.playerState == AudioPlayerState.PLAYING
                          ? Icons.pause
                          : Icons.play_arrow,
                      size: 40.0,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      if (audioManager.playerState ==
                          AudioPlayerState.PLAYING) {
                        await audioManager.pause();
                      }
                      if (audioManager.playerState == AudioPlayerState.PAUSED) {
                        await audioManager.play(song);
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.skip_next,
                      size: 40.0,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      print('next button pressed');
                    },
                  ),
                ],
              ),
              SizedBox(
                width: 8.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
