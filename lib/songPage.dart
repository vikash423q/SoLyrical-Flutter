import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';

import './audioManager.dart';

class SongPage extends StatefulWidget {
  final AudioManager _audioManager;
  SongPage(this._audioManager);

  @override
  State<StatefulWidget> createState() {
    return SongPageState();
  }

}

class SongPageState extends State<SongPage>{
  AudioManager _audioManager;
  AudioPlayerState _playerState;
  var _audioPlayerStateSubscription;

  @override
  void initState() {
    super.initState();
    _audioManager=widget._audioManager;
    _playerState=_audioManager.playerState;
    _audioPlayerStateSubscription =_audioManager.audioPlayer.onPlayerStateChanged.listen((_state){
      setState(() {
        print('setting player state in songpage');
        _playerState=_state;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayerStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var song = _audioManager.playingNow;
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
            MovingSlider(_audioManager.audioPlayer),
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
                  onPressed: () async {
                    setState(() {
                        _playerState =AudioPlayerState.PLAYING;
                      });
                      return await _audioManager.playPrev();
                  },
                ),
                SizedBox(
                  width: 10.0,
                ),
                IconButton(
                  icon: Icon(
                    _playerState == AudioPlayerState.PLAYING
                        ? Icons.pause
                        : Icons.play_arrow,
                    size: 40.0,
                  ),
                  onPressed: () async {
                    if (_playerState == AudioPlayerState.PLAYING) {
                        setState(() {
                          _playerState = AudioPlayerState.PAUSED;
                        });
                        return await _audioManager.pause();
                      }
                      if (_playerState == AudioPlayerState.PAUSED) {
                        setState(() {
                          _playerState = AudioPlayerState.PLAYING;
                        });
                        return await _audioManager.play(song);
                      }
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
                  onPressed: () async {
                     setState(() {
                        _playerState =AudioPlayerState.PLAYING;
                      });
                      return await _audioManager.playNext();
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

class MovingSlider extends StatefulWidget {
  final AudioPlayer audioPlayer;
  MovingSlider(this.audioPlayer);
  @override
  State<StatefulWidget> createState() {
    return MovingSliderState();
  }
}

class MovingSliderState extends State<MovingSlider> {
  AudioPlayer _audioPlayer;
  int _max = 0;
  int _position = 0;
  var _positionSubscription;

  @override
  void initState() {
    super.initState();
    _audioPlayer = widget.audioPlayer;
    _positionSubscription = _audioPlayer.onAudioPositionChanged.listen((position) {
      setState(() {
        _position = position.inSeconds;
      });
    });
    setState(() {
      _max = _audioPlayer.duration.inSeconds;
    });
  }

  String _getFormattedTime(int seconds) {
    var min = (seconds ~/ 60).toString().padLeft(2, '0');
    var sec = (seconds % 60).toString().padLeft(2, '0');
    return min + ":" + sec;
  }

  @override
  void dispose() {
    _positionSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Slider(
          inactiveColor: Colors.grey[400],
          activeColor: Colors.grey[600],
          min: 0,
          max: _max.toDouble(),
          value: _position.toDouble(),
          onChanged: (val) async {
            setState(() {
              _position = val.toInt();
            });
            await _audioPlayer.seek(val);
          },
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(_getFormattedTime(_position)),
              Text(_getFormattedTime(_max)),
            ],
          ),
        ),
      ],
    );
  }
}
