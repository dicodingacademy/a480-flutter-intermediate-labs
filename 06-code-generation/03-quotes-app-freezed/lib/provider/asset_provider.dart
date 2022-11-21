import 'package:flutter/material.dart';

import '../model/loading_state.dart';
import '../service/asset_service.dart';

class ApiProvider extends ChangeNotifier {
  final AssetService assetService;

  ApiProvider(this.assetService);

  /// todo-04-02: change initial state into a new class
  LoadingState quotesState = const LoadingState.initial();

  Future<void> getQuotes() async {
    try {
      /// todo-04-03: change loading state into a new class
      quotesState = const LoadingState.loading();
      notifyListeners();

      final result = await assetService.getQuotes();

      /// todo-04-04: change loaded state into a new class
      quotesState = LoadingState.loaded(result.list);

      notifyListeners();
    } catch (e) {
      /// todo-04-05: change error state into a new class
      quotesState = const LoadingState.error("Get quotes failed");
      notifyListeners();
    }
  }
}
