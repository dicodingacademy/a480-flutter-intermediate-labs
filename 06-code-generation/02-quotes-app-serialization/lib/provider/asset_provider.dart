import 'package:flutter/material.dart';
import '../model/quote.dart';

import '../model/loading_state.dart';
import '../service/asset_service.dart';

class ApiProvider extends ChangeNotifier {
  final AssetService assetService;

  ApiProvider(this.assetService);

  LoadingState quotesState = LoadingState.initial;
  String quotesMessage = "";

  List<Quote> quotes = [];

  Future<void> getQuotes() async {
    try {
      quotesState = LoadingState.loading;
      notifyListeners();

      final result = await assetService.getQuotes();

      quotes.addAll(result.list);
      quotesState = LoadingState.loaded;

      notifyListeners();
    } catch (e) {
      quotesState = LoadingState.error;
      quotesMessage = "Get quotes failed";
      notifyListeners();
    }
  }
}
