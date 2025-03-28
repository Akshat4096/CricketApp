class AppConfig {
  AppConfig._();
  static const String baseUrl = 'http://bets.neoxiontechnolabs.com/api/';
  static const int timeoutDuration = 5000;
  static const bool enableLogging = true;
}

class EndPoints {
  EndPoints._();
  static const register = 'register/';
  static const login = 'login/';
  static const forgotpassword = 'forgot_password/';
  static const verifyotp = 'verify_otp/';
  static const resetpassword = 'reset_password/';
  static const profile = 'profile/';
  static const getevents = 'get-events-new/';
  static const getscores = 'get-scores/';
  static const getquiz = 'get-quiz/?match_id=';
  static const submitquiz = 'submit-answer/';
}
