import 'package:audioplayer/audioplayer.dart';
import './song.dart';

class AudioManager {
  final AudioPlayer audioPlayer;
  AudioPlayerState playerState;
  Song playingNow;

  AudioManager(this.audioPlayer) {
    playerState = AudioPlayerState.STOPPED;
  }

  Future<void> play(Song song) async {
    await audioPlayer.play(song.path);
    playerState = AudioPlayerState.PLAYING;
    playingNow = song;
  }

  Future<void> pause() async {
    await audioPlayer.pause();
    playerState = AudioPlayerState.PAUSED;
  }

  Future<void> stop() async {
    await audioPlayer.stop();
    playerState = AudioPlayerState.STOPPED;
  }
}
