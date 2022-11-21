import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../provider/video_notifier.dart';
import '../utils/utils.dart';
import '../widget/buffer_slider_controller_widget.dart';
import '../widget/video_controller_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// todo-02-init-01: create a variabel to declare an instance VideoPlayerController and isVideoInitialize
  VideoPlayerController? controller;
  bool isVideoInitialize = false;

  /// todo-02-init-02: create a function to initiate a video controller
  void videoInitialize() async {
    /// todo-02-init-03: instantiating the video controller and disposing the previous one
    final previousVideoController = controller;
    final videoController = VideoPlayerController.asset(
      "assets/butterfly.mp4",
    );

    /// todo-05-url-01: if video source from url
    // final videoController = VideoPlayerController.network(
    //   "https://github.com/dicodingacademy/assets/releases/download/release-video/VideoDicoding.mp4",
    // );

    await previousVideoController?.dispose();

    /// todo-02-init-04: Initialize controller
    try {
      await videoController.initialize();
    } on Exception catch (e) {
      print('Error initializing video: $e');
    }

    /// todo-02-init-05: update the boolean
    if (mounted) {
      setState(() {
        controller = videoController;
        isVideoInitialize = controller!.value.isInitialized;
      });

      /// todo-03-listen-01: check if video is already initialize
      if (isVideoInitialize) {
        /// todo-03-listen-02: update all the state value inside provider
        final provider = context.read<VideoNotifier>();
        controller?.addListener(() {
          provider.duration = controller?.value.duration ?? Duration.zero;
          provider.position = controller?.value.position ?? Duration.zero;
          provider.isPlay = controller?.value.isPlaying ?? false;
        });
      }
    }
  }

  @override
  void initState() {
    /// todo-02-init-06: run videoInitialize in setState method
    videoInitialize();

    super.initState();
  }

  @override
  void dispose() {
    /// todo-02-init-07: don't forget to dispose the controller
    controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Player Project"),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          /// todo-04-ui-01: update the video preview using boolean check
          isVideoInitialize
              ? AspectRatio(
                  aspectRatio: controller!.value.aspectRatio,
                  child: VideoPlayer(
                    controller!,
                  ),
                )
              : const CircularProgressIndicator(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// todo-04-ui-02: cover with Consumer widget to update the value
                Consumer<VideoNotifier>(
                  builder: (context, provider, child) {
                    /// todo-04-ui-03: fill the value based on provider value
                    /// you can add the utils file to support text formatting
                    final duration = provider.duration;
                    final position = provider.position;

                    return BufferSliderControllerWidget(
                      maxValue: duration.inSeconds.toDouble(),
                      currentValue: position.inSeconds.toDouble(),
                      minText: durationToTimeString(position),
                      maxText: durationToTimeString(duration),
                      onChanged: (value) async {
                        /// todo-04-ui-04: update the audio player when slider is move
                        final newPosition = Duration(seconds: value.toInt());
                        await controller?.seekTo(newPosition);

                        /// todo-04-ui-05: resume the audio player after user move the slider
                        await controller?.play();
                      },
                    );
                  },
                ),

                /// todo-04-ui-06: cover with Consumer widget to update the value
                Consumer<VideoNotifier>(
                  builder: (context, provider, child) {
                    final isPlay = provider.isPlay;
                    return VideoControllerWidget(
                      onPlayTapped: () {
                        /// todo-04-ui-08: play the player when user tap the pause button
                        controller?.play();
                      },
                      onPauseTapped: () {
                        /// todo-04-ui-09: pause the player when user tap the play button
                        controller?.pause();
                      },

                      /// todo-04-ui-07: update the isPlay state
                      isPlay: isPlay,
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
