import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';

import './songPage.dart';
import './song.dart';
import './audioManager.dart';

class Controller extends StatefulWidget {
  final AudioManager audioManager;

  Controller(this.audioManager);

  @override
  State<StatefulWidget> createState() {
    return ControllerState();
  }
}

class ControllerState extends State<Controller> {
  AudioManager _audioManager;
  Song song;
  AudioPlayerState playerState;

  @override
  void initState() {
    _audioManager = widget.audioManager;
    song = _audioManager.playingNow;
    playerState = _audioManager.playerState;
    super.initState();
    _audioManager.audioPlayer.onPlayerStateChanged.listen((s) {
      if (s == AudioPlayerState.PLAYING) {
        setState(() {
          song = _audioManager.playingNow;
          playerState = AudioPlayerState.PLAYING;
        });
      } else if (s == AudioPlayerState.STOPPED ||
          s == AudioPlayerState.COMPLETED ||
          s == AudioPlayerState.PAUSED) {
        setState(() {
          playerState = s;
        });
      }
    }, onError: (msg) {
      setState(() {
        playerState = AudioPlayerState.STOPPED;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => SongPage(_audioManager)));
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
                      playerState == AudioPlayerState.PLAYING
                          ? Icons.pause
                          : Icons.play_arrow,
                      size: 40.0,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      if (playerState == AudioPlayerState.PLAYING) {
                        await _audioManager.pause();
                        setState(() {
                          playerState = AudioPlayerState.PAUSED;
                        });
                      }
                      if (playerState == AudioPlayerState.PAUSED) {
                        await _audioManager.play(song);
                        setState(() {
                          playerState = AudioPlayerState.PLAYING;
                        });
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
