import 'package:ny_cricket_app/app/data/api_client/api_client.dart';
import 'package:ny_cricket_app/app/data/repositories/home_reository.dart';
import 'package:ny_cricket_app/app/ui/pages/home/model/fetch_events_model.dart';
import 'package:ny_cricket_app/app/ui/pages/home/model/fetch_live_event_model.dart';
import 'package:ny_cricket_app/app/ui/pages/home/model/get_quiz_model.dart';
import 'package:ny_cricket_app/app/ui/pages/home/model/get_score_model.dart';
import 'package:ny_cricket_app/app/ui/pages/home/model/submit_quiz_model.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';
import 'package:injectable/injectable.dart' as i;
import 'package:ny_cricket_app/app/utils/helpers/loading.dart';
import 'package:toastification/toastification.dart';

@i.lazySingleton
@i.injectable
class HomeController extends GetxController {
  var fetcheventData = Rxn<FetchEventsModel>();
  var fetchliveeventData = Rxn<FetchLiveEventsModel>();
  var getScoreData = Rxn<GetScoreModel>();
  var isquizLoading = false.obs;

  Future<void> fetchupcomingevents() async {
    Loading.show();
    try {
      HomeRepository homeRepository = HomeRepository(apiClient: ApiClient());
      FetchEventsModel profile = await homeRepository.fetchupcomingevents();

      fetcheventData.value = profile;
      fetcheventData.refresh();
      Loading.dismiss();
    } catch (e) {
      Loading.dismiss();
      Logger.log(e.toString());
    }
  }

  Future<void> fetchliveevents() async {
    Loading.show();
    try {
      HomeRepository homeRepository = HomeRepository(apiClient: ApiClient());
      FetchLiveEventsModel profile = await homeRepository.fetchliveevents();

      fetchliveeventData.value = profile;
      fetcheventData.refresh();
      Loading.dismiss();
    } catch (e) {
      Loading.dismiss();
      Logger.log(e.toString());
    }
  }

  bool _isFirstFetch = true;
  Future<void> getscoreDetails(int eventid) async {
    if (_isFirstFetch) {
      Loading.show();
    }

    try {
      HomeRepository homeRepository = HomeRepository(apiClient: ApiClient());
      GetScoreModel getScoreModel =
          await homeRepository.getScoreApi(eventid: eventid.toString());
      Logger.log(
          "===============================${getScoreModel.data.isEmpty}");
      if (getScoreModel.data.isNotEmpty) {
        getScoreData.value = getScoreModel;
      } else {
        Logger.log("No score details found.");
      }
    } catch (e) {
      Logger.log(e.toString());
    } finally {
      if (_isFirstFetch) {
        Loading.dismiss();
        _isFirstFetch = false;
      }
    }
  }

  //QUIZ
  final currentQuestionIndex = 0.obs;
  final questions = <Question>[].obs;

  void nextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
    }
  }

  void previousQuestion() {
    if (currentQuestionIndex.value > 0) {
      currentQuestionIndex.value--;
    }
  }

  Future<void> getQuizApi(String matchId) async {
    isquizLoading.value = true;
    Loading.show();
    try {
      HomeRepository homeRepository = HomeRepository(apiClient: ApiClient());
      QuizModel quizModel = await homeRepository.getQuizApi(matchid: matchId);

      if (quizModel.status == true && quizModel.data != null) {
        isquizLoading.value = false;
        Loading.dismiss();

        questions.value = quizModel.data?.map<Question>((questionData) {
              return Question(
                quizId: questionData.id ?? 0,
                text: questionData.question.toString(),
                options: questionData.options
                        ?.map((option) => Option(
                            id: option.id ?? 0, text: option.option.toString()))
                        .toList() ??
                    [],
              );
            }).toList() ??
            <Question>[];
      }
    } catch (e) {
      Logger.log(e.toString());
    } finally {
      isquizLoading.value = false;
      Loading.dismiss();
    }
  }
  final selectedOptions = <Map<String, dynamic>>[].obs;
  final elapsedTime = '00:00:00'.obs;
  final quizScore = 0.obs;
  final quizAttempts = 1.obs;
  void submitQuiz(String matchId) async {
    try {
      var currentQuestion = questions[currentQuestionIndex.value];
       selectedOptions.add({
        "question_id": currentQuestion.quizId,
        "answer": int.parse(currentQuestion.selectedAnswer ?? '0'),
      });
      HomeRepository homeRepository = HomeRepository(apiClient: ApiClient());

    //  SubmitQuizModel submitQuizModel = await homeRepository.submitQuizApi(
    //     matchId: int.parse(matchId),
    //     userId: 1, // Get from auth
    //     score: quizScore.value,
    //     numberOfAttempt: quizAttempts.value,
    //     selectedOptions: selectedOptions,
    //     time: elapsedTime.value, // Pass the elapsed time
    //   );
      SubmitQuizModel submitQuizModel = await homeRepository.submitQuizApi(
        
        quizid: currentQuestion.quizId,
        optionid: int.parse(currentQuestion.selectedAnswer ?? '0'),
      );

      if (submitQuizModel.status == true) {
        currentQuestion.correctOptionId = submitQuizModel.isCorrect;
        currentQuestion.isAnswered = true;
        currentQuestion.points = submitQuizModel.points;

        questions.refresh();
        if (submitQuizModel.points == 0) {
          Navigator.pop(Get.context!);
        }
      } else {
        if (submitQuizModel.points == 0) {
          Navigator.pop(Get.context!);
        }
        toastification.show(
          type: ToastificationType.warning,
          showProgressBar: false,
          title: Text(
            submitQuizModel.message ?? 'Something went wrong!',
            style: GoogleFonts.montserrat(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          autoCloseDuration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      Logger.log('Error submitting quiz answer: $e');
    }
  }
}

class Question {
  final int quizId;
  final String text;
  final List<Option> options;
  String? selectedAnswer;
  bool? correctOptionId;
  bool isAnswered = false;
  int? points;

  Question({
    required this.quizId,
    required this.text,
    required this.options,
    this.selectedAnswer,
    this.correctOptionId,
    this.points,
  });
}

class Option {
  final int id;
  final String text;

  Option({required this.id, required this.text});
}
