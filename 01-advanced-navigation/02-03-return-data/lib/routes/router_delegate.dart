import 'package:declarative_navigation/screen/form_screen.dart';
import 'package:flutter/material.dart';

import '../model/quote.dart';
import '../screen/quote_detail_screen.dart';
import '../screen/quotes_list_screen.dart';

class MyRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;

  MyRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  String? selectedQuote;

  /// todo-02-delegate-01: add form page state
  bool isForm = false;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey("QuotesListScreen"),
          child: QuotesListScreen(
            quotes: quotes,
            onTapped: (String quoteId) {
              selectedQuote = quoteId;
              notifyListeners();
            },

            /// todo-02-delegate-04: handle FormScreen callback
            toFormScreen: () {
              isForm = true;
              notifyListeners();
            },
          ),
        ),
        if (selectedQuote != null)
          MaterialPage(
            key: ValueKey(selectedQuote),
            child: QuoteDetailsScreen(
              quoteId: selectedQuote!,
            ),
          ),

        /// todo-02-delegate-02: add FormScreen page
        if (isForm)
          MaterialPage(
            key: const ValueKey("FormScreen"),
            child: FormScreen(
              /// todo-02-delegate-03: handle onSend callback
              onSend: () {
                isForm = false;
                notifyListeners();
              },
            ),
          ),
      ],
      onDidRemovePage: (page) {
        if (page.key == ValueKey(selectedQuote)) {
          selectedQuote = null;
          notifyListeners();
        }
        if (isForm) {
          isForm = false;
          notifyListeners();
        }
      },
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) async {
    /* Do Nothing */
  }
}
