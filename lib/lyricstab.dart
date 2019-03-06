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
  final String listUrl = 'https://search.azlyrics.com/search.php?q=';
  final String listregex =
      "<a (?:href=\"(.*?)\".*<b>(.*?)</b></a>  by <b>(.*?)</b><br>)+?";
  final String lyricsUrl = 'http://vikashgaurav.com/lyrics';
  AudioManager _audioManager;
  Song _song;
  Duration _duration;
  int _position;
  var _audioPlayerStateSubscription;
  var _positionSubscription;

  @override
  void initState() {
    super.initState();
    _audioManager = widget._audioManager;
    var _audioPlayer = _audioManager.audioPlayer;
    _song = _audioManager.playingNow;
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
  }

  String _getLyricsLocal() {
    if (_song.lyrics == null) {
      _getLyricsNetwork();
      return '';
    } else
      return _song.lyrics;
  }

  Future _getLyricsNetwork() async {
    print('getting lyrics from network');
    http.Response response = await http.get(listUrl + _song.title);
    String res = response.body;
    RegExp exp = new RegExp(listregex);
    Iterable<Match> matches = exp.allMatches(res);
    List<String> pages = [];
    // saving all pages found as result
    matches.forEach((item) => pages.add(item.group(1)));
    if (pages.length == 0) return null;
    response = await http.post(lyricsUrl, body: {'url': pages[0]});
    String lyrics = response.body;
    _song.lyrics = lyrics;
    await _song.updateInDb();
    setState(() {
      _song = _song;
    });
  }

  @override
  void dispose() {
    _audioPlayerStateSubscription.cancel();
    _positionSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(_song.lyrics == null ? _getLyricsLocal() : _song.lyrics),
      ),
    );
  }
}
