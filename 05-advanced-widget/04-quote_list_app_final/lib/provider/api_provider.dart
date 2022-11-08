import 'package:flutter/material.dart';
import '../model/quote.dart';
import '../service/api_service.dart';

import '../model/api_state.dart';

class ApiProvider extends ChangeNotifier {
  final ApiService apiService;

  ApiProvider(this.apiService);

  ApiState quotesState = ApiState.initial;
  String quotesMessage = "";

  bool quotesError = false;

  List<Quote> quotes = [];

  /// todo-01-01: create a new state about page and size item
  int? pageItems = 1;

  int sizeItems = 10;

  Future<void> getQuotes() async {
    try {
      /// todo-01-02: set a loading only in the first page
      if (pageItems == 1) {
        quotesState = ApiState.loading;
        notifyListeners();
      }

      /// todo-01-03: insert the variabel into getQuotes method
      final result = await apiService.getQuotes(pageItems!, sizeItems);

      quotes.addAll(result.list);
      quotesMessage = "Success";
      quotesError = false;
      quotesState = ApiState.loaded;

      /// todo-04-01: set the pageItems to null when the result is not the same as before
      if (result.list.length < sizeItems) {
        pageItems = null;
      } else {
        /// todo-01-04: increase the page after the API request is done
        pageItems = pageItems! + 1;
      }

      notifyListeners();
    } catch (e) {
      quotesState = ApiState.error;
      quotesError = true;
      quotesMessage = "Get quotes failed";
      notifyListeners();
    }
  }
}
