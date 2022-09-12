/// todo 4: create PageConfiguration class to define each page combination
class PageConfiguration {
  final bool unknown;
  final bool register;
  final bool? loggedIn;
  final String? quoteId;

  PageConfiguration.splash()
      : unknown = false,
        register = false,
        loggedIn = null,
        quoteId = null;

  PageConfiguration.login()
      : unknown = false,
        register = false,
        loggedIn = false,
        quoteId = null;

  PageConfiguration.register()
      : unknown = false,
        register = true,
        loggedIn = false,
        quoteId = null;

  PageConfiguration.home()
      : unknown = false,
        register = false,
        loggedIn = true,
        quoteId = null;

  PageConfiguration.detailQuote(String id)
      : unknown = false,
        register = false,
        loggedIn = true,
        quoteId = id;

  PageConfiguration.unknown()
      : unknown = true,
        register = false,
        loggedIn = null,
        quoteId = null;

  bool get isSplashPage => unknown == false && loggedIn == null;
  bool get isLoginPage => unknown == false && loggedIn == false;
  bool get isHomePage =>
      unknown == false && loggedIn == true && quoteId == null;
  bool get isDetailPage =>
      unknown == false && loggedIn == true && quoteId != null;
  bool get isRegisterPage => register == true;
  bool get isUnknownPage => unknown == true;
}
