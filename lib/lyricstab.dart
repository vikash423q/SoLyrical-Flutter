import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'dart:convert';

import './audioManager.dart';
import './song.dart';

class LyricsTab extends StatefulWidget {
  final AudioManager _audioManager;

  LyricsTab(this._audioManager);
  @override
  State<StatefulWidget> createState() {
    return LyricsTabState();
  }
}

class LyricsTabState extends State<LyricsTab> {
  final String listUrl = 'http://vikashgaurav.com/lyrics';
  final String lyricsUrl = 'http://vikashgaurav.com/lyrics/url';
  AudioManager _audioManager;
  Song _song;
  Duration _duration;
  List<dynamic> _relatedLyrics;
  int _position;
  var _audioPlayerStateSubscription;
  var _positionSubscription;
  dynamic _dropDownValue;

  @override
  void initState() {
    super.initState();
    _audioManager = widget._audioManager;
    var _audioPlayer = _audioManager.audioPlayer;
    _song = _audioManager.playingNow;
    _dropDownValue = {'title': _song.title, 'artist': _song.artist};
    _relatedLyrics = [_dropDownValue];
    _audioPlayerStateSubscription =
        _audioPlayer.onPlayerStateChanged.listen((_state) {
      if (_state == AudioPlayerState.PLAYING) {
        setState(() {
          _song = _audioManager.playingNow;
          _duration = _audioManager.audioPlayer.duration;
        });
      }
    });
    _positionSubscription =
        _audioPlayer.onAudioPositionChanged.listen((position) {
      // setState(() {
      //   _position = position.inSeconds;
      // });
    });
    _getLyricsNetwork();
  }

  @override
  void didUpdateWidget(LyricsTab oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  String _getLyricsLocal() {
    if (_song.lyrics == null) {
      _getLyricsNetwork();
      return 'Fetching Lyrics..';
    } else
      return _song.lyrics;
  }

  Future _getLyricsNetwork() async {
    print('getting lyrics from network');
    http.Response response = await http.post(listUrl, body: {
      'title': _song.title,
      'artist': _song.artist,
      'album': _song.album
    });
    var res = jsonDecode(response.body);
    var matches = res['matches'];
    var defaultLyrics = res['lyrics'];
    _song.lyrics = defaultLyrics;
    print(await _song.updateInDb());
    if (mounted) {
      setState(() {
        _song = _song;
        _relatedLyrics = matches != null
            ? matches
            : [
                {'title': _song.title, 'artist': _song.artist}
              ];
        _dropDownValue = matches != null
            ? matches[0]
            : {'title': _song.title, 'artist': _song.artist};
      });
    }
  }

  Future<List<dynamic>> _getRelatedLyrics() async {
    http.Response response = await http.post(listUrl, body: {
      'title': _song.title,
      'artist': _song.artist,
      'album': _song.album
    });
    var res = jsonDecode(response.body);
    var matches = res['matches'];
    if (mounted) {
      setState(() {
        _relatedLyrics = matches;
      });
    }
    return matches;
  }

  @override
  void dispose() {
    _audioPlayerStateSubscription.cancel();
    _positionSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_relatedLyrics);
    return Center(
      child: Column(
        children: <Widget>[
          DropdownButton(
            iconSize: 32.0,
            value: _relatedLyrics[0],
            items: _relatedLyrics.map<DropdownMenuItem<dynamic>>((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item['title'] + " by " + item['artist']),
              );
            }).toList(),
            onChanged: (dynamic newValue) async {
              http.Response response =
                  await http.post(lyricsUrl, body: {'url': newValue['url']});
              var res = jsonDecode(response.body);
              _song.lyrics = res['lyrics'];
              await _song.updateInDb();
              setState(() {
                _dropDownValue = newValue;
              });
            },
          ),
          Expanded(
            child: Container(
              child: Text(_song == null
                  ? 'Have A Musical Day'
                  : (_song.lyrics == null ? _getLyricsLocal() : _song.lyrics)),
            ),
          ),
        ],
      ),
    );
  }
}
