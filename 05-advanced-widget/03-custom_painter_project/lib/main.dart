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
  late AnimationController pacmanController;
  late Animation<double> pacmanAnimation;
  late AnimationController rippleController;
  late Animation<double> rippleAnimation;

  @override
  void initState() {
    pacmanController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    pacmanAnimation = Tween(begin: 1.0, end: 1.2).animate(pacmanController);
    pacmanController.repeat(reverse: true);

    rippleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    rippleAnimation = Tween(begin: 0.0, end: 1.0).animate(rippleController);
    rippleController.repeat();

    super.initState();
  }

  @override
  void dispose() {
    pacmanController.dispose();
    rippleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge([pacmanAnimation, rippleAnimation]),
          builder: (context, child) {
            return CustomPaint(
              foregroundPainter: PacmanAnimation(
                color: Colors.yellow,
                value: pacmanAnimation.value,
                width: 100,
                height: 100,
              ),
              painter: RippleAnimation(
                color: Colors.black,
                value: rippleAnimation.value,
              ),
              child: const SizedBox(width: 300, height: 300),
            );
          },
        ),
      ),
    );
  }
}
