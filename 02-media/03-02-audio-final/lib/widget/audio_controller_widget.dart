import 'package:flutter/material.dart';

class AudioControllerWidget extends StatelessWidget {
  final Function onPlayTapped;
  final Function onStopTapped;
  final Function onPauseTapped;
  final bool isPlay;

  const AudioControllerWidget({
    super.key,
    required this.onPlayTapped,
    required this.onStopTapped,
    required this.onPauseTapped,
    required this.isPlay,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              if (isPlay) {
                onPauseTapped();
              } else {
                onPlayTapped();
              }
            },
            icon: Icon(
              isPlay ? Icons.pause : Icons.play_arrow,
            ),
            iconSize: 30,
          ),
          IconButton(
            onPressed: () => onStopTapped(),
            icon: const Icon(Icons.stop),
            iconSize: 30,
          ),
        ],
      ),
    );
  }
}
