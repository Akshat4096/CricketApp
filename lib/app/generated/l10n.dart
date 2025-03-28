// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Lang {
  Lang();

  static Lang? _current;

  static Lang get current {
    assert(
      _current != null,
      'No instance of Lang was loaded. Try to initialize the Lang delegate before accessing Lang.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Lang> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Lang();
      Lang._current = instance;

      return instance;
    });
  }

  static Lang of(BuildContext context) {
    final instance = Lang.maybeOf(context);
    assert(
      instance != null,
      'No instance of Lang present in the widget tree. Did you add Lang.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static Lang? maybeOf(BuildContext context) {
    return Localizations.of<Lang>(context, Lang);
  }

  /// `Cricket App`
  String get lbl_app_name {
    return Intl.message(
      'Cricket App',
      name: 'lbl_app_name',
      desc: '',
      args: [],
    );
  }

  /// `Oops! It seems the connection timed out. Please check your internet connection and try again.`
  String get err_connection_timeout_description {
    return Intl.message(
      'Oops! It seems the connection timed out. Please check your internet connection and try again.',
      name: 'err_connection_timeout_description',
      desc: '',
      args: [],
    );
  }

  /// `Uh-oh! Your request took longer than expected. Please try again later.`
  String get err_request_timeout_description {
    return Intl.message(
      'Uh-oh! Your request took longer than expected. Please try again later.',
      name: 'err_request_timeout_description',
      desc: '',
      args: [],
    );
  }

  /// `Oops! We're having trouble receiving data right now. Please try again later.`
  String get err_data_reception_issue_description {
    return Intl.message(
      'Oops! We\'re having trouble receiving data right now. Please try again later.',
      name: 'err_data_reception_issue_description',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, there's a problem with the security certificate. Please contact support for assistance.`
  String get err_security_certificate_problem_description {
    return Intl.message(
      'Sorry, there\'s a problem with the security certificate. Please contact support for assistance.',
      name: 'err_security_certificate_problem_description',
      desc: '',
      args: [],
    );
  }

  /// `Oh no! We received an unexpected response from the server. Please try again later.`
  String get err_unexpected_server_response_description {
    return Intl.message(
      'Oh no! We received an unexpected response from the server. Please try again later.',
      name: 'err_unexpected_server_response_description',
      desc: '',
      args: [],
    );
  }

  /// `Your request has been cancelled. Please try again.`
  String get err_request_cancelled_description {
    return Intl.message(
      'Your request has been cancelled. Please try again.',
      name: 'err_request_cancelled_description',
      desc: '',
      args: [],
    );
  }

  /// `We're having trouble connecting to the server. Please check your internet connection and try again.`
  String get err_connection_issue_description {
    return Intl.message(
      'We\'re having trouble connecting to the server. Please check your internet connection and try again.',
      name: 'err_connection_issue_description',
      desc: '',
      args: [],
    );
  }

  /// `Oops! Something went wrong. Please try again later.`
  String get err_unknown_error_description {
    return Intl.message(
      'Oops! Something went wrong. Please try again later.',
      name: 'err_unknown_error_description',
      desc: '',
      args: [],
    );
  }

  /// `Connection Timeout`
  String get err_connection_timeout {
    return Intl.message(
      'Connection Timeout',
      name: 'err_connection_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Request Timeout`
  String get err_request_timeout {
    return Intl.message(
      'Request Timeout',
      name: 'err_request_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Data Reception Issue`
  String get err_data_reception_issue {
    return Intl.message(
      'Data Reception Issue',
      name: 'err_data_reception_issue',
      desc: '',
      args: [],
    );
  }

  /// `Security Certificate Problem`
  String get err_security_certificate_problem {
    return Intl.message(
      'Security Certificate Problem',
      name: 'err_security_certificate_problem',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected Server Response`
  String get err_unexpected_server_response {
    return Intl.message(
      'Unexpected Server Response',
      name: 'err_unexpected_server_response',
      desc: '',
      args: [],
    );
  }

  /// `Request Cancelled`
  String get err_request_cancelled {
    return Intl.message(
      'Request Cancelled',
      name: 'err_request_cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Connection Issue`
  String get err_connection_issue {
    return Intl.message(
      'Connection Issue',
      name: 'err_connection_issue',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Error`
  String get err_unknown_error {
    return Intl.message(
      'Unknown Error',
      name: 'err_unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get lbl_settings {
    return Intl.message('Setting', name: 'lbl_settings', desc: '', args: []);
  }

  /// `Change Theme`
  String get lbl_change_theme {
    return Intl.message(
      'Change Theme',
      name: 'lbl_change_theme',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get lbl_change_language {
    return Intl.message(
      'Change Language',
      name: 'lbl_change_language',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get lbl_dark_mode {
    return Intl.message('Dark Mode', name: 'lbl_dark_mode', desc: '', args: []);
  }

  /// `Light Mode`
  String get lbl_light_mode {
    return Intl.message(
      'Light Mode',
      name: 'lbl_light_mode',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get lbl_system_mode {
    return Intl.message('System', name: 'lbl_system_mode', desc: '', args: []);
  }

  /// `Please enter the details for sign in your account.`
  String get lbl_signin_subtitle {
    return Intl.message(
      'Please enter the details for sign in your account.',
      name: 'lbl_signin_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the details for sign up your account.`
  String get lbl_signup_subtitle {
    return Intl.message(
      'Please enter the details for sign up your account.',
      name: 'lbl_signup_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Email Id`
  String get lbl_email {
    return Intl.message('Email Id', name: 'lbl_email', desc: '', args: []);
  }

  /// `E-mail`
  String get lbl_email_id {
    return Intl.message('E-mail', name: 'lbl_email_id', desc: '', args: []);
  }

  /// `Enter Email`
  String get lbl_email_hint {
    return Intl.message(
      'Enter Email',
      name: 'lbl_email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get lbl_remember_me {
    return Intl.message(
      'Remember Me',
      name: 'lbl_remember_me',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get lbl_password {
    return Intl.message('Password', name: 'lbl_password', desc: '', args: []);
  }

  /// `Enter Password`
  String get lbl_password_hint {
    return Intl.message(
      'Enter Password',
      name: 'lbl_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Name`
  String get lbl_name_hint {
    return Intl.message(
      'Enter Your Name',
      name: 'lbl_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get lbl_signin {
    return Intl.message('Sign In', name: 'lbl_signin', desc: '', args: []);
  }

  /// `Forgot Password?`
  String get lbl_forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'lbl_forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get lbl_or {
    return Intl.message('Or', name: 'lbl_or', desc: '', args: []);
  }

  /// `Send`
  String get lbl_send {
    return Intl.message('Send', name: 'lbl_send', desc: '', args: []);
  }

  /// `Forgot Your Password`
  String get lbl_forgot_your_password {
    return Intl.message(
      'Forgot Your Password',
      name: 'lbl_forgot_your_password',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get lbl_new_password {
    return Intl.message(
      'New Password',
      name: 'lbl_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get lbl_confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'lbl_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Create New Password`
  String get lbl_create_new_password {
    return Intl.message(
      'Create New Password',
      name: 'lbl_create_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get lbl_save {
    return Intl.message('Save', name: 'lbl_save', desc: '', args: []);
  }

  /// `Verify Your Email`
  String get lbl_verify_your_email {
    return Intl.message(
      'Verify Your Email',
      name: 'lbl_verify_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get lbl_verify {
    return Intl.message('Verify', name: 'lbl_verify', desc: '', args: []);
  }

  /// `Request new code in`
  String get lbl_request_new_code {
    return Intl.message(
      'Request new code in',
      name: 'lbl_request_new_code',
      desc: '',
      args: [],
    );
  }

  /// `Resend code`
  String get lbl_resend_code {
    return Intl.message(
      'Resend code',
      name: 'lbl_resend_code',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account?`
  String get lbl_dont_have_an_account {
    return Intl.message(
      'Don’t have an account?',
      name: 'lbl_dont_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get lbl_sign_up {
    return Intl.message('Sign Up', name: 'lbl_sign_up', desc: '', args: []);
  }

  /// `Name`
  String get lbl_name {
    return Intl.message('Name', name: 'lbl_name', desc: '', args: []);
  }

  /// `Already have an Account?`
  String get lbl_already_have_an_account {
    return Intl.message(
      'Already have an Account?',
      name: 'lbl_already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to `
  String get lbl_welcome_to {
    return Intl.message(
      'Welcome to ',
      name: 'lbl_welcome_to',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get lbl_follow {
    return Intl.message('Follow', name: 'lbl_follow', desc: '', args: []);
  }

  /// `Share`
  String get lbl_share {
    return Intl.message('Share', name: 'lbl_share', desc: '', args: []);
  }

  /// `Cricket World!`
  String get lbl_cricket_world {
    return Intl.message(
      'Cricket World!',
      name: 'lbl_cricket_world',
      desc: '',
      args: [],
    );
  }

  /// `Live Matches`
  String get lbl_live_matches {
    return Intl.message(
      'Live Matches',
      name: 'lbl_live_matches',
      desc: '',
      args: [],
    );
  }

  /// `Your Opinions`
  String get lbl_your_opinions {
    return Intl.message(
      'Your Opinions',
      name: 'lbl_your_opinions',
      desc: '',
      args: [],
    );
  }

  /// `Explore live and upcoming matches and stay updated with every ball.`
  String get lbl_onboarding_one_subtitle {
    return Intl.message(
      'Explore live and upcoming matches and stay updated with every ball.',
      name: 'lbl_onboarding_one_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Stay updated with real-time scores, commentary, and match details.`
  String get lbl_onboarding_two_subtitle {
    return Intl.message(
      'Stay updated with real-time scores, commentary, and match details.',
      name: 'lbl_onboarding_two_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Join the conversation, share your thoughts, and discuss match moments`
  String get lbl_onboarding_three_subtitle {
    return Intl.message(
      'Join the conversation, share your thoughts, and discuss match moments',
      name: 'lbl_onboarding_three_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get lbl_skip {
    return Intl.message('Skip', name: 'lbl_skip', desc: '', args: []);
  }

  /// `Next`
  String get lbl_next {
    return Intl.message('Next', name: 'lbl_next', desc: '', args: []);
  }

  /// `Start Now`
  String get lbl_start_now {
    return Intl.message('Start Now', name: 'lbl_start_now', desc: '', args: []);
  }

  /// `Referral Code`
  String get lbl_referral_code {
    return Intl.message(
      'Referral Code',
      name: 'lbl_referral_code',
      desc: '',
      args: [],
    );
  }

  /// `Enter Referral Code`
  String get lbl_referral_code_hint {
    return Intl.message(
      'Enter Referral Code',
      name: 'lbl_referral_code_hint',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get lbl_forgot_password_title {
    return Intl.message(
      'Forgot Password',
      name: 'lbl_forgot_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email Id for recover your password.`
  String get lbl_forgot_password_subtitle {
    return Intl.message(
      'Please enter your email Id for recover your password.',
      name: 'lbl_forgot_password_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `OTP Verification`
  String get lbl_otp_verification {
    return Intl.message(
      'OTP Verification',
      name: 'lbl_otp_verification',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your 6 digit code for recover your password.`
  String get lbl_otp_subtitle {
    return Intl.message(
      'Please enter your 6 digit code for recover your password.',
      name: 'lbl_otp_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `6 Digit OTP`
  String get lbl_6_digit_otp {
    return Intl.message(
      '6 Digit OTP',
      name: 'lbl_6_digit_otp',
      desc: '',
      args: [],
    );
  }

  /// `OTP`
  String get lbl_otp {
    return Intl.message('OTP', name: 'lbl_otp', desc: '', args: []);
  }

  /// `Didn't get an OTP?`
  String get lbl_did_not_get_otp {
    return Intl.message(
      'Didn\'t get an OTP?',
      name: 'lbl_did_not_get_otp',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get lbl_resend {
    return Intl.message('Resend', name: 'lbl_resend', desc: '', args: []);
  }

  /// `Please enter a new password which is different from your old password.`
  String get lbl_reset_password_subtitle {
    return Intl.message(
      'Please enter a new password which is different from your old password.',
      name: 'lbl_reset_password_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations!! Your password has been change successfully.`
  String get lbl_password_change_dialog_title {
    return Intl.message(
      'Congratulations!! Your password has been change successfully.',
      name: 'lbl_password_change_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get lbl_done {
    return Intl.message('Done', name: 'lbl_done', desc: '', args: []);
  }

  /// `Upcoming`
  String get lbl_upcoming {
    return Intl.message('Upcoming', name: 'lbl_upcoming', desc: '', args: []);
  }

  /// `Live`
  String get lbl_live {
    return Intl.message('Live', name: 'lbl_live', desc: '', args: []);
  }

  /// `Completed`
  String get lbl_completed {
    return Intl.message('Completed', name: 'lbl_completed', desc: '', args: []);
  }

  /// `Vs`
  String get lbl_vs {
    return Intl.message('Vs', name: 'lbl_vs', desc: '', args: []);
  }

  /// `Live Score Borad`
  String get lbl_live_score_board {
    return Intl.message(
      'Live Score Borad',
      name: 'lbl_live_score_board',
      desc: '',
      args: [],
    );
  }

  /// `Batter`
  String get lbl_batter {
    return Intl.message('Batter', name: 'lbl_batter', desc: '', args: []);
  }

  /// `R (B)`
  String get lbl_rb {
    return Intl.message('R (B)', name: 'lbl_rb', desc: '', args: []);
  }

  /// `4s`
  String get lbl_4s {
    return Intl.message('4s', name: 'lbl_4s', desc: '', args: []);
  }

  /// `6s`
  String get lbl_6s {
    return Intl.message('6s', name: 'lbl_6s', desc: '', args: []);
  }

  /// `SR`
  String get lbl_sr {
    return Intl.message('SR', name: 'lbl_sr', desc: '', args: []);
  }

  /// `Bowler`
  String get lbl_bowler {
    return Intl.message('Bowler', name: 'lbl_bowler', desc: '', args: []);
  }

  /// `W-R`
  String get lbl_wr {
    return Intl.message('W-R', name: 'lbl_wr', desc: '', args: []);
  }

  /// `Overs`
  String get lbl_overs {
    return Intl.message('Overs', name: 'lbl_overs', desc: '', args: []);
  }

  /// `Econ`
  String get lbl_econ {
    return Intl.message('Econ', name: 'lbl_econ', desc: '', args: []);
  }

  /// `Balls`
  String get lbl_balls {
    return Intl.message('Balls', name: 'lbl_balls', desc: '', args: []);
  }

  /// `P'ship:`
  String get lbl_pship {
    return Intl.message('P\'ship:', name: 'lbl_pship', desc: '', args: []);
  }

  /// `Last wkt:`
  String get lbl_lastwkt {
    return Intl.message('Last wkt:', name: 'lbl_lastwkt', desc: '', args: []);
  }

  /// `Let'splay`
  String get lbl_lets_play {
    return Intl.message(
      'Let\'splay',
      name: 'lbl_lets_play',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get lbl_reviews {
    return Intl.message('Reviews', name: 'lbl_reviews', desc: '', args: []);
  }

  /// `View All Score`
  String get lbl_view_all_score {
    return Intl.message(
      'View All Score',
      name: 'lbl_view_all_score',
      desc: '',
      args: [],
    );
  }

  /// `Total Votes`
  String get lbl_total_votes {
    return Intl.message(
      'Total Votes',
      name: 'lbl_total_votes',
      desc: '',
      args: [],
    );
  }

  /// `Score Board`
  String get lbl_score_board {
    return Intl.message(
      'Score Board',
      name: 'lbl_score_board',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get lbl_my_profile {
    return Intl.message(
      'My Profile',
      name: 'lbl_my_profile',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get lbl_logout {
    return Intl.message('Log Out', name: 'lbl_logout', desc: '', args: []);
  }

  /// `Are you sure you want to logout?`
  String get lbl_logout_text {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'lbl_logout_text',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get lbl_no {
    return Intl.message('No', name: 'lbl_no', desc: '', args: []);
  }

  /// `Yes`
  String get lbl_yes {
    return Intl.message('Yes', name: 'lbl_yes', desc: '', args: []);
  }

  /// `Quiz`
  String get lbl_quiz {
    return Intl.message('Quiz', name: 'lbl_quiz', desc: '', args: []);
  }

  /// `Please Enter your Email Address to Receive a Verification Card.`
  String get msg_please_enter_email_address {
    return Intl.message(
      'Please Enter your Email Address to Receive a Verification Card.',
      name: 'msg_please_enter_email_address',
      desc: '',
      args: [],
    );
  }

  /// `Your New Password Must Be Different from Previously Used Password.`
  String get msg_your_new_password {
    return Intl.message(
      'Your New Password Must Be Different from Previously Used Password.',
      name: 'msg_your_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter 6 Digit Code Send To Your Email.`
  String get msg_please_enter_6_digit_code {
    return Intl.message(
      'Please Enter 6 Digit Code Send To Your Email.',
      name: 'msg_please_enter_6_digit_code',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Lang> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Lang> load(Locale locale) => Lang.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
