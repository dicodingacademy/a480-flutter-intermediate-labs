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

  Future<void> getQuotes() async {
    try {
      quotesState = ApiState.loading;
      notifyListeners();

      final result = await apiService.getQuotes();

      quotes.addAll(result.list);
      quotesMessage = "Success";
      quotesError = false;
      quotesState = ApiState.loaded;

      notifyListeners();
    } catch (e) {
      quotesState = ApiState.error;
      quotesError = true;
      quotesMessage = "Get quotes failed";
      notifyListeners();
    }
  }
}
