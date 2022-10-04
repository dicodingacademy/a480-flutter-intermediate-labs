import 'package:audioplayer_project/widget/audio_controller_widget.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/audio_notifier.dart';
import '../utils/utils.dart';
import '../widget/buffer_slider_controller_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// todo-02-init-01: create two variabel to declare an instance AudioPlayer and Source
  late final AudioPlayer audioPlayer;
  late final Source audioSource;

  @override
  void initState() {
    final provider = context.read<AudioNotifier>();

    /// todo-02-init-02: initialize those two variable in initState
    audioPlayer = AudioPlayer();
    audioSource = AssetSource("cricket.wav");
    audioPlayer.setSource(audioSource);

    /// todo-05-url-01: if audio source from url
    // audioSource = UrlSource("https://github.com/dicodingacademy/assets/raw/main/flutter_intermediate_academy/bensound_ukulele.mp3");
    // audioPlayer.setSource(audioSource);

    /// todo-03-listen-01: listen on player state change
    audioPlayer.onPlayerStateChanged.listen((state) {
      /// todo-03-listen-02: update isPlay state if state is playing using provider
      provider.isPlay = state == PlayerState.playing;

      /// todo-03-listen-06: update position state if state is stopped using provider
      if (state == PlayerState.stopped) {
        provider.position = Duration.zero;
      }
    });

    /// todo-03-listen-03: listen on duration change
    audioPlayer.onDurationChanged.listen((duration) {
      provider.duration = duration;
    });

    /// todo-03-listen-04: listen on position change
    audioPlayer.onPositionChanged.listen((position) {
      provider.position = position;
    });

    /// todo-03-listen-05: listen on player complete
    audioPlayer.onPlayerComplete.listen((_) {
      provider.position = Duration.zero;
      provider.isPlay = false;
    });

    super.initState();
  }

  @override
  void dispose() {
    /// todo-02-init-03: don't forget to dispose the controller
    audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audio Player Project"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// todo-04-ui-01: cover with Consumer widget to update the value
          Consumer<AudioNotifier>(
            builder: (context, provider, child) {
              /// todo-04-ui-02: fill the value based on provider value
              /// you can add the utils file to support text formatting
              final duration = provider.duration;
              final position = provider.position;

              return BufferSliderControllerWidget(
                maxValue: duration.inSeconds.toDouble(),
                currentValue: position.inSeconds.toDouble(),
                minText: durationToTimeString(position),
                maxText: durationToTimeString(duration),
                onChanged: (value) async {
                  /// todo-04-ui-03: update the audio player when slider is move
                  final newPosition = Duration(seconds: value.toInt());
                  await audioPlayer.seek(newPosition);

                  /// todo-04-ui-04: resume the audio player after user move the slider
                  await audioPlayer.resume();
                },
              );
            },
          ),

          /// todo-04-ui-05: cover with Consumer widget to update the value
          Consumer<AudioNotifier>(
            builder: (context, provider, child) {
              final bool isPlay = provider.isPlay;
              return AudioControllerWidget(
                onPlayTapped: () {
                  /// todo-04-ui-07: play the player when user tap the pause button
                  audioPlayer.play(audioSource);
                },
                onPauseTapped: () {
                  /// todo-04-ui-08: pause the player when user tap the play button
                  audioPlayer.pause();
                },
                onStopTapped: () {
                  /// todo-04-ui-09: stop the player when user tap the stop button
                  audioPlayer.stop();
                },

                /// todo-04-ui-096 update the isPlay state
                isPlay: isPlay,
              );
            },
          ),
        ],
      ),
    );
  }
}
