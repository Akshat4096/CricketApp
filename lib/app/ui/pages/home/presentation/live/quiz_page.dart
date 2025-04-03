import 'package:ny_cricket_app/app/controller/home_controller.dart';
import 'package:ny_cricket_app/app/generated/l10n.dart';
import 'package:ny_cricket_app/app/ui/widgets/custom/custom_app_bar.dart';
import 'package:ny_cricket_app/app/utils/helpers/dimenson.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';
import 'package:ny_cricket_app/app/utils/helpers/getItHook/getit_hook.dart';

class QuizPage extends GetItHook<HomeController> {
  final String matchId = Get.arguments;
    final Stopwatch _quizTimer = Stopwatch();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Obx(() => _buildQuizContent()),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: Lang.of(context).lbl_quiz,
      centerTitle: true,
      iconcolor: ThemeData().customColors.whiteColor,
    );
  }

  Widget _buildQuizContent() {
    return controller.isquizLoading.value
        ? SizedBox.shrink()
        : (controller.questions.isBlank ?? true)
            ? Center(
                child: Text('No quiz found..!'),
              )
            : Column(
                children: [
                  _buildQuestionIndicator(),
                  _buildQuestionBox(),
                  _buildNavigationButtons(),
                ],
              );
  }

  Widget _buildQuestionIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          controller.questions.length,
          (index) => _buildIndicatorCircle(index),
        ),
      ),
    );
  }

  Widget _buildIndicatorCircle(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == controller.currentQuestionIndex.value
            ? Get.theme.primaryColor
            : Get.theme.customColors.lightgreycolor,
      ),
      child: Center(
        child: Text(
          '${index + 1}',
          style: Get.textTheme.bodyMedium?.copyWith(
            color: index == controller.currentQuestionIndex.value
                ? Get.theme.customColors.blackColor
                : Get.theme.customColors.whiteColor,
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionBox() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Get.theme.customColors.lightgreycolor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildQuestionText(),
            ..._buildOptions(),
            buildSizedBoxH(16),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionText() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        '${controller.currentQuestionIndex.value + 1}. ${controller.questions[controller.currentQuestionIndex.value].text}',
        style: Get.textTheme.bodyMedium?.copyWith(
          color: Get.theme.customColors.whiteColor,
          fontSize: 18.sp,
        ),
      ),
    );
  }

  List<Widget> _buildOptions() {
    return List.generate(
      controller
          .questions[controller.currentQuestionIndex.value].options.length,
      (index) => _buildOptionTile(index),
    );
  }

  Widget _buildOptionTile(int index) {
    final question =
        controller.questions[controller.currentQuestionIndex.value];
    final option = question.options[index];

    bool isSelected = question.selectedAnswer == option.id.toString();
    bool isCorrect = question.correctOptionId == true && isSelected;
    bool isWrong = question.correctOptionId == false && isSelected;
    bool isDisabled = question.isAnswered;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: InkWell(
        onTap: isDisabled
            ? null
            : () {
                question.selectedAnswer = option.id.toString();
                controller.submitQuiz(matchId);
              },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: isCorrect
                ? Colors.green
                : isWrong
                    ? Colors.red
                    : Get.theme.customColors.blackColor,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Text(
            '${String.fromCharCode(65 + index)}. ${option.text}',
            style: Get.textTheme.bodyMedium?.copyWith(
              color: isCorrect || isWrong
                  ? Get.theme.customColors.whiteColor
                  : Get.theme.customColors.whiteColor,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildNavButton(Icons.arrow_back_ios, controller.previousQuestion,
              isNext: false),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '${controller.currentQuestionIndex.value + 1}',
              style: Get.textTheme.bodyMedium?.copyWith(
                color: Get.theme.primaryColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildNavButton(Icons.arrow_forward_ios, controller.nextQuestion),
        ],
      ),
    );
  }

  Widget _buildNavButton(IconData icon, VoidCallback onPressed,
      {bool isNext = true}) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isNext ? Get.theme.primaryColor : null,
        border: isNext
            ? null
            : Border.all(color: Get.theme.primaryColor, width: 2.w),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon,
            color: isNext
                ? Get.theme.customColors.blackColor
                : Get.theme.primaryColor,
            size: 20.sp),
        onPressed: onPressed,
      ),
    );
  }

  @override
  bool get canDisposeController => false;

  @override
  void onDispose() {
    _quizTimer.stop();
  }

  String get elapsedTime {
    // Format the elapsed time as HH:MM:SS
    return _quizTimer.elapsed.toString().split('.').first.padLeft(8, '0');
  }


  @override
  void onInit() {
    controller.currentQuestionIndex.value = 0;
    controller.getQuizApi(matchId);
    _quizTimer.start();
  }
}
