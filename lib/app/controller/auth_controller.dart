import 'package:injectable/injectable.dart' as i;
import 'package:ny_cricket_app/app/data/api_client/api_client.dart';
import 'package:ny_cricket_app/app/data/repositories/auth_repository.dart';
import 'package:ny_cricket_app/app/generated/l10n.dart';
import 'package:ny_cricket_app/app/global/asset_constants.dart';
import 'package:ny_cricket_app/app/ui/pages/authentication/model/forgot_password_model.dart';
import 'package:ny_cricket_app/app/ui/pages/authentication/model/register_model.dart';
import 'package:ny_cricket_app/app/ui/pages/authentication/model/signin_model.dart';
import 'package:ny_cricket_app/app/ui/widgets/custom/custom_dialog_widget.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';
import 'package:ny_cricket_app/app/utils/helpers/extensions/extensions.dart';
import 'package:ny_cricket_app/app/utils/helpers/injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@i.lazySingleton
@i.injectable
class AuthController extends GetxController {
  AuthController() {
    onInit();
  }

  bool isDarkTheme = false;

//FORGOT PASSWORD
  final forgotformKey = GlobalKey<FormState>();
  final forgotemailController = TextEditingController();
  final forgotemailFocusNode = FocusNode();
  var forgotisLoading = false.obs;

  Future<void> forgotpassword() async {
    if (!forgotformKey.currentState!.validate()) return;
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    forgotisLoading.value = true;
    try {
      AuthRepository authRepository = AuthRepository(apiClient: ApiClient());
      ForgotPasswordModel forgotPasswordModel =
          await authRepository.forgotpassword(
        email: forgotemailController.text.trim(),
      );
      if (forgotPasswordModel.status == true) {
        Get.toNamed(AppRoutes.verifyCode);
      }
    } catch (e) {
      Logger.log(e.toString());
    } finally {
      forgotisLoading.value = false;
    }
  }

//VERIFY OTP
  final verifyotpformKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  final FocusNode otpFocusNode = FocusNode();
  var otpisLoading = false.obs;
  Future<void> verifyotp() async {
    if (!verifyotpformKey.currentState!.validate()) return;
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    otpisLoading.value = true;
    try {
      AuthRepository authRepository = AuthRepository(apiClient: ApiClient());
      SignUpModel verifyotpModel = await authRepository.verifyotp(
        email: forgotemailController.text.trim(),
        otp: otpController.text.trim(),
      );
      if (verifyotpModel.status == true) {
        getIt<SharedPreferences>().setToken = verifyotpModel.token;
        Get.offNamed(AppRoutes.resetPassword);
        forgotemailController.clear();
        otpController.clear();
      }
    } catch (e) {
      Logger.log(e.toString());
    } finally {
      otpisLoading.value = false;
    }
  }

//RESET PASSWORD PAGE
  final resetformKey = GlobalKey<FormState>();
  final createNewPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final createNewPasswordFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  Future<void> resetPassword() async {
    if (!resetformKey.currentState!.validate()) return;
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    isLoading.value = true;
    try {
      AuthRepository authRepository = AuthRepository(apiClient: ApiClient());
      SignUpModel resetpasswordModel = await authRepository.resetPassword(
        password: confirmPasswordController.text.trim(),
      );
      if (resetpasswordModel.status == true) {
        showDialog(
          context: Get.context!,
          builder: (context) {
            return CustomDialog(
              icon: AssetConstants.pngSuccess,
              message: Lang.of(context).lbl_password_change_dialog_title,
              buttonText: Lang.of(context).lbl_done,
              onButtonPressed: () {
                Get.offAllNamed(AppRoutes.login);
              },
            );
          },
        );
        createNewPasswordController.clear();
        confirmPasswordController.clear();
      }
    } catch (e) {
      Logger.log(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //LOGIN
  final loginformKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final emailpasswordFocusNode = FocusNode();
  var isRememberMeChecked = false.obs;
  var isloginLoading = false.obs;

  void toggleRememberMe() {
    isRememberMeChecked.value = !isRememberMeChecked.value;
  }

  void signIn() async {
    if (!loginformKey.currentState!.validate()) return;
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    isloginLoading.value = true;
    try {
      AuthRepository authRepository = AuthRepository(apiClient: ApiClient());
      SigninModel signinModel = await authRepository.loginapi(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (signinModel.status == true) {
        getIt<SharedPreferences>().setToken = signinModel.token;
        Get.offAllNamed(AppRoutes.home);

        emailController.clear();
        passwordController.clear();
      }
    } catch (e) {
      Logger.log(e.toString());
    } finally {
      isloginLoading.value = false;
    }
  }
  // SIGNUP

  final registerformKey = GlobalKey<FormState>();
  final TextEditingController signupemailController = TextEditingController();
  final TextEditingController signuppasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController signupconfirmPasswordController =
      TextEditingController();
  final TextEditingController referralCodeController = TextEditingController();

  final FocusNode signupemailFocusNode = FocusNode();
  final FocusNode signuppasswordFocusNode = FocusNode();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  final FocusNode referralCodeFocusNode = FocusNode();
  var issignupLoading = false.obs;

  Future<void> signUp() async {
    if (!registerformKey.currentState!.validate()) return;
    FocusScope.of(Get.context!).requestFocus(FocusNode());

    issignupLoading.value = true;
    try {
      AuthRepository authRepository = AuthRepository(apiClient: ApiClient());
      SignUpModel signUpModel = await authRepository.registerApi(
          name: nameController.text.trim(),
          email: signupemailController.text.trim(),
          password: signupconfirmPasswordController.text.trim(),
          referalcode: referralCodeController.text.trim());
      if (signUpModel.status == true) {
        getIt<SharedPreferences>().setToken = signUpModel.token;
        Get.offAllNamed(AppRoutes.home);
        signupemailController.clear();
        signuppasswordController.clear();
        nameController.clear();
        signupconfirmPasswordController.clear();
        referralCodeController.clear();
      }
    } catch (e) {
      Logger.log(e.toString());
    } finally {
      issignupLoading.value = false;
    }
  }

  @override
  @i.disposeMethod
  void dispose() {
    super.dispose();
    signupemailController.dispose();
    signuppasswordController.dispose();
    nameController.dispose();
    signupconfirmPasswordController.dispose();
    referralCodeController.dispose();
    signupemailFocusNode.dispose();
    signuppasswordFocusNode.dispose();
    nameFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    emailController.dispose();
    passwordController.dispose();
    forgotemailController.dispose();
    referralCodeFocusNode.dispose();
    otpController.dispose();
  }
}
