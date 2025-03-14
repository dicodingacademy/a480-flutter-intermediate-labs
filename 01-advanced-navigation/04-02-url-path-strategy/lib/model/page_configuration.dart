/// todo 4: create PageConfiguration class to define each page combination
sealed class PageConfiguration {}

final class SplashPageConfiguration extends PageConfiguration {}

final class LoginPageConfiguration extends PageConfiguration {}

final class RegisterPageConfiguration extends PageConfiguration {}

final class HomePageConfiguration extends PageConfiguration {}

final class DetailQuotePageConfiguration extends PageConfiguration {
  final String? quoteId;

  DetailQuotePageConfiguration(this.quoteId);
}

final class UnknownPageConfiguration extends PageConfiguration {}
