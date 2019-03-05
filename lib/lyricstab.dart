import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:http/http.dart' as http;

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
  final String lyricsUrl = 'https://search.azlyrics.com/search.php?q=';
  final String listregex =
      "<a (?:href=\"(.*?)\".*<b>(.*?)</b></a>  by <b>(.*?)</b><br>)+?";
  final String lyricsregex =
      "<div>\\n<!-- Usage of azlyrics.com content by any third-party lyrics provider is prohibited by our licensing agreement. Sorry about that. -->\\n((?:(?:.*)?\\n)*?)<\\/div>";
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
    }
    return '';
  }

  Future<String> _getLyricsNetwork() async {
    print('getting lyrics from network');
    http.Response response = await http.get(lyricsUrl + _song.title);
    String res = response.body;
    RegExp exp = new RegExp(listregex);
    Iterable<Match> matches = exp.allMatches(res);
    List<String> pages = [];
    // saving all pages found as result
    matches.forEach((item) => pages.add(item.group(1)));
    // response = await http.get(pages[0], headers: headers);
    http.Client client =http.Client();
    var userClient =UserAgentClient(client);
    http.BaseRequest request = http.Request('GET', Uri.parse(pages[0]));
    http.StreamedResponse streamedResponse = await userClient.send(request);
    
    String lyricsPage = await streamedResponse.stream.bytesToString();
    print(pages[0]);
    print(lyricsPage);
    RegExp lyricsexp = new RegExp(lyricsregex);
    Match match = lyricsexp.firstMatch(lyricsPage);
    String lyrics = match.group(0);
    lyrics = lyrics.replaceAll("<br>", "\n");
    lyrics = lyrics.replaceAll("<.*?>", "");
    lyrics = lyrics.replaceAll("&quot;", "\"");
    print(lyrics);
    return lyrics;
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
        child: Text(_getLyricsLocal()),
      ),
    );
  }
}

class UserAgentClient extends http.BaseClient {
  final http.Client _inner;

  UserAgentClient(this._inner);

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['User-Agent'] = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36';
    request.headers['Origin'] = 'https://www.facebook.com';
    request.headers['Referer'] = 'https://www.facebook.com';
    return _inner.send(request);
  }
}
