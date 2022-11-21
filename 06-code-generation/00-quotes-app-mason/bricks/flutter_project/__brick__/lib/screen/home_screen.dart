import 'package:flutter/material.dart';

{{#isStateless}}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("{{appName.titleCase()}}"),
      ),
      body: Center(
        child: Text(
          "This is {{appName.titleCase()}}",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
{{/isStateless}}
{{^isStateless}}
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
        title: const Text("{{appName.titleCase()}}"),
      ),
      body: Center(
        child: Text(
          "This is my {{appName.titleCase()}}",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
{{/isStateless}}