import 'package:flutter/material.dart';

import 'animations/pacman_animation.dart';
import 'animations/ripple_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late Animation<double> _animation1;
  late Animation<double> _animation2;

  @override
  void initState() {
    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation1 = Tween(begin: 1.0, end: 1.2).animate(_controller1);
    _controller1.repeat(reverse: true);

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animation2 = Tween(begin: 0.0, end: 1.0).animate(_controller2);
    _controller2.repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge([_animation1, _animation2]),
          builder: (context, child) {
            return CustomPaint(
              foregroundPainter: PacmanAnimation(
                color: Colors.yellow,
                value: _animation1.value,
                width: 100,
                height: 100,
              ),
              painter: RippleAnimation(
                color: Colors.black,
                value: _animation2.value,
              ),
              child: const SizedBox(width: 300, height: 300),
            );
          },
        ),
      ),
    );
  }
}
