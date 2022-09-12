import 'package:declarative_navigation/screen/quotes_list_screen.dart';
import 'package:flutter/material.dart';

import 'model/quote.dart';
import 'screen/quote_detail_screen.dart';

void main() {
  runApp(const QuotesApp());
}

/// todo 3: change the widget to StatefulWidget
class QuotesApp extends StatefulWidget {
  const QuotesApp({Key? key}) : super(key: key);

  @override
  State<QuotesApp> createState() => _QuotesAppState();
}

class _QuotesAppState extends State<QuotesApp> {
  /// todo 4: add quote variable for selected quote
  String? selectedQuote;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes App',

      /// todo 1: add Navigator widget and cover the screen with Page class.
      home: Navigator(
        pages: [
          MaterialPage(
            // key: const ValueKey("QuotesListScreen"),
            child: QuotesListScreen(
              quotes: quotes,

              /// todo 7: add new method for tap action
              onTapped: (String quoteId) {
                setState(() {
                  selectedQuote = quoteId;
                });
              },
            ),
          ),

          /// todo 5: add Detail Screen and cover with Page class.
          /// todo 6: add conditional statement
          if (selectedQuote != null)
            MaterialPage(
              // key: const ValueKey("QuoteDetailsScreen"),
              child: QuoteDetailsScreen(
                quoteId: selectedQuote!,
              ),
            ),
        ],

        /// todo 2: add onPopPage method
        onPopPage: (route, result) {
          final didPop = route.didPop(result);
          if (!didPop) {
            return false;
          }

          /// todo 8: add setState for go back to other screen
          setState(() {
            selectedQuote = null;
          });

          return true;
        },
      ),
    );
  }
}
