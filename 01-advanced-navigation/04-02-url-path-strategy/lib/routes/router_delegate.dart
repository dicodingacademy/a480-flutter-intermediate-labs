import 'package:declarative_navigation/model/page_configuration.dart';
import 'package:declarative_navigation/screen/register_screen.dart';
import 'package:flutter/material.dart';

import '../db/auth_repository.dart';
import '../model/quote.dart';
import '../screen/login_screen.dart';
import '../screen/quote_detail_screen.dart';
import '../screen/quotes_list_screen.dart';
import '../screen/splash_screen.dart';
import '../screen/unknown_screen.dart';

class MyRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;
  final AuthRepository authRepository;

  bool? isUnknown;

  MyRouterDelegate(this.authRepository)
    : _navigatorKey = GlobalKey<NavigatorState>() {
    _init();
  }

  _init() async {
    isLoggedIn = await authRepository.isLoggedIn();
    notifyListeners();
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  String? selectedQuote;

  List<Page> historyStack = [];
  bool? isLoggedIn;
  bool isRegister = false;

  @override
  Widget build(BuildContext context) {
    if (isUnknown == true) {
      historyStack = _unknownStack;
    } else if (isLoggedIn == null) {
      historyStack = _splashStack;
    } else if (isLoggedIn == true) {
      historyStack = _loggedInStack;
    } else {
      historyStack = _loggedOutStack;
    }
    return Navigator(
      key: navigatorKey,
      pages: historyStack,
      onDidRemovePage: (page) {
        if (page.key == ValueKey(selectedQuote)) {
          selectedQuote = null;
          notifyListeners();
        }
        if (isRegister) {
          isRegister = false;
          notifyListeners();
        }
      },
    );
  }

  @override
  PageConfiguration? get currentConfiguration {
    if (isLoggedIn == null) {
      return SplashPageConfiguration();
    } else if (isRegister == true) {
      return RegisterPageConfiguration();
    } else if (isLoggedIn == false) {
      return LoginPageConfiguration();
    } else if (isUnknown == true) {
      return UnknownPageConfiguration();
    } else if (selectedQuote == null) {
      return HomePageConfiguration();
    } else if (selectedQuote != null) {
      return DetailQuotePageConfiguration(selectedQuote!);
    } else {
      return null;
    }
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) async {
    switch (configuration) {
      case UnknownPageConfiguration():
        isUnknown = true;
        isRegister = false;
        break;
      case RegisterPageConfiguration():
        isRegister = true;
        break;
      case HomePageConfiguration() ||
          LoginPageConfiguration() ||
          SplashPageConfiguration():
        isUnknown = false;
        selectedQuote = null;
        isRegister = false;
        break;
      case DetailQuotePageConfiguration():
        isUnknown = false;
        isRegister = false;
        selectedQuote = configuration.quoteId.toString();
        break;
    }

    notifyListeners();
  }

  List<Page> get _unknownStack => const [
    MaterialPage(key: ValueKey("UnknownPage"), child: UnknownScreen()),
  ];

  List<Page> get _splashStack => const [
    MaterialPage(key: ValueKey("SplashScreen"), child: SplashScreen()),
  ];

  List<Page> get _loggedOutStack => [
    MaterialPage(
      key: const ValueKey("LoginPage"),
      child: LoginScreen(
        onLogin: () {
          isLoggedIn = true;
          notifyListeners();
        },
        onRegister: () {
          isRegister = true;
          notifyListeners();
        },
      ),
    ),
    if (isRegister == true)
      MaterialPage(
        key: const ValueKey("RegisterPage"),
        child: RegisterScreen(
          onRegister: () {
            isRegister = false;
            notifyListeners();
          },
          onLogin: () {
            isRegister = false;
            notifyListeners();
          },
        ),
      ),
  ];

  List<Page> get _loggedInStack => [
    MaterialPage(
      key: const ValueKey("QuotesListPage"),
      child: QuotesListScreen(
        quotes: quotes,
        onTapped: (String quoteId) {
          selectedQuote = quoteId;
          notifyListeners();
        },
        onLogout: () {
          isLoggedIn = false;
          notifyListeners();
        },
      ),
    ),
    if (selectedQuote != null)
      MaterialPage(
        key: ValueKey(selectedQuote),
        child: QuoteDetailsScreen(quoteId: selectedQuote!),
      ),
  ];
}
