import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

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
    return YaruPage(
      children: [
        const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              onPressed: () {},
              child: const Text("Outlined Button"),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Text Button"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Elevated Button"),
            ),
          ],
        ),
      ],
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
        return YaruRow(
          actionWidget: Icon(YaruIcons.information),
          trailingWidget: Text("Item ${index + 1}"),
          description: "Subtitle ${index + 1}",
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
      pageItems: [
        YaruPageItem(
          titleBuilder: (context) => Text("First Screen"),
          builder: (context) => FirstScreen(),
          iconData: YaruIcons.document,
        ),
        YaruPageItem(
          titleBuilder: (context) => Text("Second Screen"),
          builder: (context) => SecondScreen(),
          iconData: YaruIcons.format_ordered_list,
        ),
      ],
      leftPaneWidth: 280,
      appBar: AppBar(
        title: Text("Yaru Theme App"),
      ),
    );
  }
}
