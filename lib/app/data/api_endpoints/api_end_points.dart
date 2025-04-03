class AppConfig {
  AppConfig._();
  static const String baseUrl = 'http://bets.neoxiontechnolabs.com/api/';
  static const String mainUrl = 'http://bets.neoxiontechnolabs.com';

  // static const String baseUrl = 'https://f3fa-2401-4900-8899-a4d9-9f61-2e5d-5aa4-409d.ngrok-free.app/api/';
  // static const String mainUrl = 'https://f3fa-2401-4900-8899-a4d9-9f61-2e5d-5aa4-409d.ngrok-free.app';

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
  static const getquizresult = 'get-quiz-result/';
  static const editprofile = 'edit-profile/';
}
