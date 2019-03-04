import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';

import './audioManager.dart';

class SongPage extends StatelessWidget {
  final AudioManager audioManager;
  SongPage(this.audioManager);

  @override
  Widget build(BuildContext context) {
    var song = audioManager.playingNow;
    return Scaffold(
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
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 280,
              width: 280,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(color: Colors.grey[500], blurRadius: 16.0),
              ]),
              margin: EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
              padding: EdgeInsets.all(0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                child: Hero(
                  tag: 'song',
                  child: song == null || song.imageData == null
                      ? Image.asset(
                          'assets/logo.png',
                          height: 280,
                          width: 280,
                        )
                      : Image.memory(
                          song.imageData,
                          height: 280,
                          width: 280,
                        ),
                ),
              ),
            ),
            Slider(
              inactiveColor: Colors.grey[400],
              activeColor: Colors.grey[600],
              min: 0,
              max: 100,
              value: 30,
              onChanged: (val) {
                print('Slider moved to $val');
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              song != null ? (song.title != null ? song.title : '') : '',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              song != null ? (song.album != null ? song.album : '') : '',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.fast_rewind,
                    size: 40.0,
                  ),
                  onPressed: () {
                    print('prev pressed');
                  },
                ),
                SizedBox(
                  width: 10.0,
                ),
                IconButton(
                  icon: Icon(
                    audioManager.playerState == AudioPlayerState.PLAYING
                        ? Icons.pause
                        : Icons.play_arrow,
                    size: 40.0,
                  ),
                  onPressed: () {
                    print('play pressed');
                  },
                ),
                SizedBox(
                  width: 10.0,
                ),
                IconButton(
                  icon: Icon(
                    Icons.fast_forward,
                    size: 40.0,
                  ),
                  onPressed: () {
                    print('next pressed');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MovingSlider extends StatefulWidget{
  final AudioPlayer  audioPlayer;
  MovingSlider(this.audioPlayer); 
  @override
  State<StatefulWidget> createState() {
    return MovingSliderState();
  }
}

class MovingSliderState extends State<MovingSlider>{
  AudioPlayer _audioPlayer;
  Duration _position;

  @override
  void initState() {
    super.initState();
    _audioPlayer=widget.audioPlayer;
    _audioPlayer.onAudioPositionChanged.listen((position){
      setState(() {
        _position=position;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Slider(
              inactiveColor: Colors.grey[400],
              activeColor: Colors.grey[600],
              min: 0,
              max: 100,
              value: double.parse(_position.inSeconds),
              onChanged: (val) {
                
              },
          );
  }
}
