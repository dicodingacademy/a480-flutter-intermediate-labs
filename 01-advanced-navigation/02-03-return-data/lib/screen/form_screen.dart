import 'package:declarative_navigation/routes/page_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// todo-01-setup-02: add form screen
class FormScreen extends StatefulWidget {
  final Function onSend;

  const FormScreen({
    super.key,
    required this.onSend,
  });

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: "Enter your name.",
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                /// todo-04-navigate-02: send data to previous screen
                final name = _textController.text;

                widget.onSend();

                context.read<PageManager>().returnData(name);
              },
              child: const Text("Send"),
            ),
          ],
        ),
      ),
    );
  }
}
