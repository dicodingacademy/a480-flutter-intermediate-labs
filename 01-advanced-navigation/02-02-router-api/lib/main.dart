import 'package:declarative_navigation/routes/router_delegate.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const QuotesApp());
}

class QuotesApp extends StatefulWidget {
  const QuotesApp({Key? key}) : super(key: key);

  @override
  State<QuotesApp> createState() => _QuotesAppState();
}

class _QuotesAppState extends State<QuotesApp> {
  late MyRouterDelegate myRouterDelegate;

  @override
  void initState() {
    super.initState();
    myRouterDelegate = MyRouterDelegate();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Quotes App',

      /// todo 4: change Navigator widget to Router widget
      home: Router(
        routerDelegate: myRouterDelegate,

        /// todo 5: add backButtonnDispatcher to handle System Back Button
        backButtonDispatcher: RootBackButtonDispatcher(),
      ),
    );
  }
}