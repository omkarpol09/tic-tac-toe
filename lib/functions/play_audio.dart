import 'package:just_audio/just_audio.dart';

AudioPlayer audioPlayer = AudioPlayer();

Future<void> playTapAudio() async {
  await audioPlayer.setAsset('assets/audios/mixkit-hard-pop-click-2364.wav');
  audioPlayer.play();
}
