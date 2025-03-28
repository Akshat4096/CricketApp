// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "err_connection_issue": MessageLookupByLibrary.simpleMessage(
      "Connection Issue",
    ),
    "err_connection_issue_description": MessageLookupByLibrary.simpleMessage(
      "We\'re having trouble connecting to the server. Please check your internet connection and try again.",
    ),
    "err_connection_timeout": MessageLookupByLibrary.simpleMessage(
      "Connection Timeout",
    ),
    "err_connection_timeout_description": MessageLookupByLibrary.simpleMessage(
      "Oops! It seems the connection timed out. Please check your internet connection and try again.",
    ),
    "err_data_reception_issue": MessageLookupByLibrary.simpleMessage(
      "Data Reception Issue",
    ),
    "err_data_reception_issue_description": MessageLookupByLibrary.simpleMessage(
      "Oops! We\'re having trouble receiving data right now. Please try again later.",
    ),
    "err_request_cancelled": MessageLookupByLibrary.simpleMessage(
      "Request Cancelled",
    ),
    "err_request_cancelled_description": MessageLookupByLibrary.simpleMessage(
      "Your request has been cancelled. Please try again.",
    ),
    "err_request_timeout": MessageLookupByLibrary.simpleMessage(
      "Request Timeout",
    ),
    "err_request_timeout_description": MessageLookupByLibrary.simpleMessage(
      "Uh-oh! Your request took longer than expected. Please try again later.",
    ),
    "err_security_certificate_problem": MessageLookupByLibrary.simpleMessage(
      "Security Certificate Problem",
    ),
    "err_security_certificate_problem_description":
        MessageLookupByLibrary.simpleMessage(
          "Sorry, there\'s a problem with the security certificate. Please contact support for assistance.",
        ),
    "err_unexpected_server_response": MessageLookupByLibrary.simpleMessage(
      "Unexpected Server Response",
    ),
    "err_unexpected_server_response_description":
        MessageLookupByLibrary.simpleMessage(
          "Oh no! We received an unexpected response from the server. Please try again later.",
        ),
    "err_unknown_error": MessageLookupByLibrary.simpleMessage("Unknown Error"),
    "err_unknown_error_description": MessageLookupByLibrary.simpleMessage(
      "Oops! Something went wrong. Please try again later.",
    ),
    "lbl_4s": MessageLookupByLibrary.simpleMessage("4s"),
    "lbl_6_digit_otp": MessageLookupByLibrary.simpleMessage("6 Digit OTP"),
    "lbl_6s": MessageLookupByLibrary.simpleMessage("6s"),
    "lbl_already_have_an_account": MessageLookupByLibrary.simpleMessage(
      "Already have an Account?",
    ),
    "lbl_app_name": MessageLookupByLibrary.simpleMessage("Cricket App"),
    "lbl_balls": MessageLookupByLibrary.simpleMessage("Balls"),
    "lbl_batter": MessageLookupByLibrary.simpleMessage("Batter"),
    "lbl_bowler": MessageLookupByLibrary.simpleMessage("Bowler"),
    "lbl_change_language": MessageLookupByLibrary.simpleMessage(
      "Change Language",
    ),
    "lbl_change_theme": MessageLookupByLibrary.simpleMessage("Change Theme"),
    "lbl_completed": MessageLookupByLibrary.simpleMessage("Completed"),
    "lbl_confirm_password": MessageLookupByLibrary.simpleMessage(
      "Confirm Password",
    ),
    "lbl_create_new_password": MessageLookupByLibrary.simpleMessage(
      "Create New Password",
    ),
    "lbl_cricket_world": MessageLookupByLibrary.simpleMessage("Cricket World!"),
    "lbl_dark_mode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
    "lbl_did_not_get_otp": MessageLookupByLibrary.simpleMessage(
      "Didn\'t get an OTP?",
    ),
    "lbl_done": MessageLookupByLibrary.simpleMessage("Done"),
    "lbl_dont_have_an_account": MessageLookupByLibrary.simpleMessage(
      "Don’t have an account?",
    ),
    "lbl_econ": MessageLookupByLibrary.simpleMessage("Econ"),
    "lbl_email": MessageLookupByLibrary.simpleMessage("Email Id"),
    "lbl_email_hint": MessageLookupByLibrary.simpleMessage("Enter Email"),
    "lbl_email_id": MessageLookupByLibrary.simpleMessage("E-mail"),
    "lbl_follow": MessageLookupByLibrary.simpleMessage("Follow"),
    "lbl_forgot_password": MessageLookupByLibrary.simpleMessage(
      "Forgot Password?",
    ),
    "lbl_forgot_password_subtitle": MessageLookupByLibrary.simpleMessage(
      "Please enter your email Id for recover your password.",
    ),
    "lbl_forgot_password_title": MessageLookupByLibrary.simpleMessage(
      "Forgot Password",
    ),
    "lbl_forgot_your_password": MessageLookupByLibrary.simpleMessage(
      "Forgot Your Password",
    ),
    "lbl_lastwkt": MessageLookupByLibrary.simpleMessage("Last wkt:"),
    "lbl_lets_play": MessageLookupByLibrary.simpleMessage("Let\'splay"),
    "lbl_light_mode": MessageLookupByLibrary.simpleMessage("Light Mode"),
    "lbl_live": MessageLookupByLibrary.simpleMessage("Live"),
    "lbl_live_matches": MessageLookupByLibrary.simpleMessage("Live Matches"),
    "lbl_live_score_board": MessageLookupByLibrary.simpleMessage(
      "Live Score Borad",
    ),
    "lbl_logout": MessageLookupByLibrary.simpleMessage("Log Out"),
    "lbl_logout_text": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to logout?",
    ),
    "lbl_my_profile": MessageLookupByLibrary.simpleMessage("My Profile"),
    "lbl_name": MessageLookupByLibrary.simpleMessage("Name"),
    "lbl_name_hint": MessageLookupByLibrary.simpleMessage("Enter Your Name"),
    "lbl_new_password": MessageLookupByLibrary.simpleMessage("New Password"),
    "lbl_next": MessageLookupByLibrary.simpleMessage("Next"),
    "lbl_no": MessageLookupByLibrary.simpleMessage("No"),
    "lbl_onboarding_one_subtitle": MessageLookupByLibrary.simpleMessage(
      "Explore live and upcoming matches and stay updated with every ball.",
    ),
    "lbl_onboarding_three_subtitle": MessageLookupByLibrary.simpleMessage(
      "Join the conversation, share your thoughts, and discuss match moments",
    ),
    "lbl_onboarding_two_subtitle": MessageLookupByLibrary.simpleMessage(
      "Stay updated with real-time scores, commentary, and match details.",
    ),
    "lbl_or": MessageLookupByLibrary.simpleMessage("Or"),
    "lbl_otp": MessageLookupByLibrary.simpleMessage("OTP"),
    "lbl_otp_subtitle": MessageLookupByLibrary.simpleMessage(
      "Please enter your 6 digit code for recover your password.",
    ),
    "lbl_otp_verification": MessageLookupByLibrary.simpleMessage(
      "OTP Verification",
    ),
    "lbl_overs": MessageLookupByLibrary.simpleMessage("Overs"),
    "lbl_password": MessageLookupByLibrary.simpleMessage("Password"),
    "lbl_password_change_dialog_title": MessageLookupByLibrary.simpleMessage(
      "Congratulations!! Your password has been change successfully.",
    ),
    "lbl_password_hint": MessageLookupByLibrary.simpleMessage("Enter Password"),
    "lbl_pship": MessageLookupByLibrary.simpleMessage("P\'ship:"),
    "lbl_quiz": MessageLookupByLibrary.simpleMessage("Quiz"),
    "lbl_rb": MessageLookupByLibrary.simpleMessage("R (B)"),
    "lbl_referral_code": MessageLookupByLibrary.simpleMessage("Referral Code"),
    "lbl_referral_code_hint": MessageLookupByLibrary.simpleMessage(
      "Enter Referral Code",
    ),
    "lbl_remember_me": MessageLookupByLibrary.simpleMessage("Remember Me"),
    "lbl_request_new_code": MessageLookupByLibrary.simpleMessage(
      "Request new code in",
    ),
    "lbl_resend": MessageLookupByLibrary.simpleMessage("Resend"),
    "lbl_resend_code": MessageLookupByLibrary.simpleMessage("Resend code"),
    "lbl_reset_password_subtitle": MessageLookupByLibrary.simpleMessage(
      "Please enter a new password which is different from your old password.",
    ),
    "lbl_reviews": MessageLookupByLibrary.simpleMessage("Reviews"),
    "lbl_save": MessageLookupByLibrary.simpleMessage("Save"),
    "lbl_score_board": MessageLookupByLibrary.simpleMessage("Score Board"),
    "lbl_send": MessageLookupByLibrary.simpleMessage("Send"),
    "lbl_settings": MessageLookupByLibrary.simpleMessage("Setting"),
    "lbl_share": MessageLookupByLibrary.simpleMessage("Share"),
    "lbl_sign_up": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "lbl_signin": MessageLookupByLibrary.simpleMessage("Sign In"),
    "lbl_signin_subtitle": MessageLookupByLibrary.simpleMessage(
      "Please enter the details for sign in your account.",
    ),
    "lbl_signup_subtitle": MessageLookupByLibrary.simpleMessage(
      "Please enter the details for sign up your account.",
    ),
    "lbl_skip": MessageLookupByLibrary.simpleMessage("Skip"),
    "lbl_sr": MessageLookupByLibrary.simpleMessage("SR"),
    "lbl_start_now": MessageLookupByLibrary.simpleMessage("Start Now"),
    "lbl_system_mode": MessageLookupByLibrary.simpleMessage("System"),
    "lbl_total_votes": MessageLookupByLibrary.simpleMessage("Total Votes"),
    "lbl_upcoming": MessageLookupByLibrary.simpleMessage("Upcoming"),
    "lbl_verify": MessageLookupByLibrary.simpleMessage("Verify"),
    "lbl_verify_your_email": MessageLookupByLibrary.simpleMessage(
      "Verify Your Email",
    ),
    "lbl_view_all_score": MessageLookupByLibrary.simpleMessage(
      "View All Score",
    ),
    "lbl_vs": MessageLookupByLibrary.simpleMessage("Vs"),
    "lbl_welcome_to": MessageLookupByLibrary.simpleMessage("Welcome to "),
    "lbl_wr": MessageLookupByLibrary.simpleMessage("W-R"),
    "lbl_yes": MessageLookupByLibrary.simpleMessage("Yes"),
    "lbl_your_opinions": MessageLookupByLibrary.simpleMessage("Your Opinions"),
    "msg_please_enter_6_digit_code": MessageLookupByLibrary.simpleMessage(
      "Please Enter 6 Digit Code Send To Your Email.",
    ),
    "msg_please_enter_email_address": MessageLookupByLibrary.simpleMessage(
      "Please Enter your Email Address to Receive a Verification Card.",
    ),
    "msg_your_new_password": MessageLookupByLibrary.simpleMessage(
      "Your New Password Must Be Different from Previously Used Password.",
    ),
  };
}
