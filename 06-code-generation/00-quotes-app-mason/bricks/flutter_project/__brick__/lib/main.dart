import 'package:flutter/material.dart';
import 'screen/home_screen.dart';

void main() {
  runApp(const {{appName.pascalCase()}}());
}

class {{appName.pascalCase()}} extends StatelessWidget {
  const {{appName.pascalCase()}}({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '{{appName.titleCase()}}',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      );
  }
}
