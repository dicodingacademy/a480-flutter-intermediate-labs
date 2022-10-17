import 'package:macos_ui/macos_ui.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MacosApp(
      title: 'Flutter Demo',
      theme: MacosThemeData(
        primaryColor: MacosColors.appleBlue,
      ),
      home: const HomeScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      toolBar: const ToolBar(
        title: Text("This is First Screen"),
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PushButton(
                        buttonSize: ButtonSize.large,
                        onPressed: () {},
                        child: const Text("Large button"),
                      ),
                      PushButton(
                        buttonSize: ButtonSize.small,
                        onPressed: () {},
                        child: const Text("Small button"),
                      ),
                      PushButton(
                        buttonSize: ButtonSize.large,
                        isSecondary: true,
                        onPressed: () {},
                        child: const Text("Secondary button"),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      toolBar: const ToolBar(
        title: Text("This is Second Screen"),
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            return ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: MacosListTile(
                    title: Text("Item ${index + 1}"),
                    subtitle: Text("Subtitle ${index + 1}"),
                    leadingWhitespace: 16,
                    onClick: () {},
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MacosWindow(
      sidebar: Sidebar(
        minWidth: 200,
        builder: (context, scrollController) {
          return SidebarItems(
            items: const [
              SidebarItem(
                leading: MacosIcon(CupertinoIcons.book),
                label: Text('First Screen'),
              ),
              SidebarItem(
                leading: MacosIcon(CupertinoIcons.list_bullet),
                label: Text('Second Screen'),
              ),
            ],
            currentIndex: currentIndex,
            onChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
          );
        },
      ),
      child: IndexedStack(
        index: currentIndex,
        children: const [
          FirstScreen(),
          SecondScreen(),
        ],
      ),
    );
  }
}
