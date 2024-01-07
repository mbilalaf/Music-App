import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController {
  final audioQuery = OnAudioQuery();
  final audioPlayer = AudioPlayer();

  @override
  void onInit() {
    super.onInit();
    checkPermission();
  }

  playSong(String? uri) async {
    try {
      // Check if the audio player is already playing, stop it before playing a new song
      if (audioPlayer.playing) {
        await audioPlayer.stop();
      }

      // Set the new audio source
      await audioPlayer.setAudioSource(
        AudioSource.uri(Uri.parse(uri!)),
      );

      // Start playing the song
      await audioPlayer.play();
    } catch (e) {
      // ignore: avoid_print
      print('Error playing song: $e');
    }
  }

  checkPermission() async {
    var per = await Permission.storage.request();
    if (per.isGranted) {
      return audioQuery.querySongs();
    } else {
      checkPermission();
    }
  }
}
