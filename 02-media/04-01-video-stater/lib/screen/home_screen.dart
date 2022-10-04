import 'package:flutter/material.dart';

import '../widget/buffer_slider_controller_widget.dart';
import '../widget/video_controller_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Player Project"),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          const CircularProgressIndicator(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BufferSliderControllerWidget(
                  maxValue: 5,
                  currentValue: 1,
                  minText: "Current Duration",
                  maxText: "Maximum Duration",
                  onChanged: (value) async {},
                ),
                VideoControllerWidget(
                  onPlayTapped: () {},
                  onPauseTapped: () {},
                  isPlay: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
