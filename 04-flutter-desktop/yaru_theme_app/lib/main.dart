import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return YaruTheme(
      builder: (context, value, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: value.theme,
          darkTheme: value.darkTheme,
          home: const HomeScreen(),
        );
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return YaruDetailPage(
      body: Column(
        children: [
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () {},
                child: const Text("Outlined Button"),
              ),
              TextButton(onPressed: () {}, child: const Text("Text Button")),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Elevated Button"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return YaruTile(
          trailing: const Icon(YaruIcons.information),
          title: Text("Item ${index + 1}"),
          subtitle: Text("Subtitle ${index + 1}"),
          enabled: true,
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return YaruMasterDetailPage(
      length: 2,
      initialIndex: 0,
      tileBuilder: (context, index, selected, availableWidth) {
        if (index == 0) {
          return const YaruMasterTile(
            leading: Icon(YaruIcons.document),
            title: Text("First Screen"),
          );
        } else {
          return const YaruMasterTile(
            leading: Icon(YaruIcons.ordered_list),
            title: Text("Second Screen"),
          );
        }
      },
      pageBuilder: (context, index) {
        if (index == 0) {
          return const FirstScreen();
        } else {
          return const SecondScreen();
        }
      },
      appBar: AppBar(title: const Text("Yaru Theme App")),
    );
  }
}
