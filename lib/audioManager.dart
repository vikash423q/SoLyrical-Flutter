import 'package:audioplayer/audioplayer.dart';
import './song.dart';

class AudioManager {
  AudioPlayer audioPlayer;
  AudioPlayerState playerState;
  List<Song> songs;
  int current;
  Song playingNow;

  AudioManager(this.songs,this.audioPlayer) {
    current=0;
    playerState = AudioPlayerState.STOPPED;
  }

  Future<void> play(Song song) async {
    await audioPlayer.play(song.path);
    playerState = AudioPlayerState.PLAYING;
    playingNow = song;
    current = songs.indexOf(song);
  }

  Future<void> playNext() async {
    if(current>=songs.length-1)
      current=-1;
    await audioPlayer.play(songs[current+1].path);
    playerState = AudioPlayerState.PLAYING;
    playingNow = songs[current+1];
  }

  Future<void> playPrev() async {
    if(current<=0)
      current=songs.length;
    await audioPlayer.play(songs[current-1].path);
    playerState = AudioPlayerState.PLAYING;
    playingNow = songs[current-1];
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
