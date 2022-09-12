import 'package:declarative_navigation/screen/quotes_list_screen.dart';
import 'package:flutter/material.dart';

import 'model/quote.dart';

void main() {
  runApp(const QuotesApp());
}

class QuotesApp extends StatelessWidget {
  const QuotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes App',
      home: QuotesListScreen(
        quotes: quotes,
      ),
    );
  }
}
