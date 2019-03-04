import 'package:flutter/services.dart';

class LocalStorage {
  static const platform = const MethodChannel('flutter.io/solyrical');

  static Future<List<String>> getLocalSongs() async {
    List<dynamic> songs;
    List<String> convertedSongs = [];
    try {
      songs = await platform.invokeMethod('getSongs');
      songs.forEach((item) => convertedSongs.add(item.toString()));
    } on PlatformException catch (e) {
      print('exception occured in fetching local songs');
      convertedSongs = null;
    }
    return convertedSongs;
  }
}
