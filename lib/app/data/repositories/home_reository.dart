import 'package:ny_cricket_app/app/data/api_client/api_client.dart';
import 'package:ny_cricket_app/app/data/api_endpoints/api_end_points.dart';
import 'package:ny_cricket_app/app/ui/pages/authentication/model/register_model.dart';
import 'package:ny_cricket_app/app/ui/pages/home/model/fetch_events_model.dart';
import 'package:ny_cricket_app/app/ui/pages/home/model/fetch_live_event_model.dart';
import 'package:ny_cricket_app/app/ui/pages/home/model/get_quiz_model.dart';
import 'package:ny_cricket_app/app/ui/pages/home/model/get_score_model.dart';
import 'package:ny_cricket_app/app/ui/pages/home/model/submit_quiz_model.dart';
import 'package:ny_cricket_app/app/utils/helpers/logger.dart';

class HomeRepository {
  final ApiClient apiClient;

  HomeRepository({required this.apiClient});

  Future<FetchEventsModel> fetchupcomingevents() async {
    try {
      var response = await apiClient.request(
          RequestType.GET, "${AppConfig.baseUrl + EndPoints.getevents}?type=0",
          withoutMessage: true);

      return FetchEventsModel.fromJson(response);
    } catch (e) {
      Logger.log('Error get home events data: $e');
      rethrow;
    }
  }

  Future<FetchLiveEventsModel> fetchliveevents() async {
    try {
      var response = await apiClient.request(
          RequestType.GET, "${AppConfig.baseUrl + EndPoints.getevents}?type=1",
          withoutMessage: true);

      return FetchLiveEventsModel.fromJson(response);
    } catch (e) {
      Logger.log('Error get home events data: $e');
      rethrow;
    }
  }

  Future<GetScoreModel> getScoreApi({
    required String eventid,
  }) async {
    try {
      final Map<String, dynamic> postData = {"event_id": eventid};

      var response = await apiClient.request(
          RequestType.POST, AppConfig.baseUrl + EndPoints.getscores,
          data: postData);

      return GetScoreModel.fromJson(response);
    } catch (e) {
      Logger.log('Error posting get score data: $e');
      rethrow;
    }
  }

  Future<QuizModel> getQuizApi({
    required String matchid,
  }) async {
    try {
      var response = await apiClient.request(
          RequestType.GET, AppConfig.baseUrl + EndPoints.getquiz + matchid,
          withoutMessage: true);

      return QuizModel.fromJson(response);
    } catch (e) {
      Logger.log('Error get quiz data: $e');
      rethrow;
    }
  }

  Future<SubmitQuizModel> submitQuizApi({
    required int quizid,
    required int optionid,
  }) async {
    try {
      final Map<String, dynamic> postData = {
        "quiz_id": quizid,
        "option_id": optionid
      };

      var response = await apiClient.request(
          RequestType.POST, AppConfig.baseUrl + EndPoints.submitquiz,
          data: postData, withoutMessage: true);

      return SubmitQuizModel.fromJson(response);
    } catch (e) {
      Logger.log('Error posting submit Quiz data: $e');
      rethrow;
    }
  }
}
