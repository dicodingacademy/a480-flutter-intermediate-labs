import 'package:audioplayer_project/widget/audio_controller_widget.dart';
import 'package:flutter/material.dart';

import '../widget/buffer_slider_controller_widget.dart';

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
        title: const Text("Audio Player Project"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BufferSliderControllerWidget(
            maxValue: 5,
            currentValue: 1,
            minText: "Current Duration",
            maxText: "Maximum Duration",
            onChanged: (value) async {},
          ),
          AudioControllerWidget(
            onPlayTapped: () {},
            onPauseTapped: () {},
            onStopTapped: () {},
            isPlay: false,
          ),
        ],
      ),
    );
  }
}
