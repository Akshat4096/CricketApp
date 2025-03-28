// class GetScoreModel {
//   final MatchData? data;

//   GetScoreModel({required this.data});

//   factory GetScoreModel.fromJson(Map<String, dynamic> json) {
//     return GetScoreModel(
//       data: MatchData.fromJson(json['data']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'data': data?.toJson(),
//     };
//   }
// }

// class MatchData {
//   final int inningsNo;
//   final int oversBowled;
//   final int runs;
//   final int wickets;
//   final List<dynamic> fow;
//   final String commentary;
//   final String summary;
//   final String lastWkt;
//   final Partnership partnership;
//   final List<RecentOver> recentOvers;
//   final Bowler bowler;
//   final List<Batsman> batsmen;
//   final Toss toss;
//   final String id;

//   MatchData({
//     required this.inningsNo,
//     required this.oversBowled,
//     required this.runs,
//     required this.wickets,
//     required this.fow,
//     required this.commentary,
//     required this.summary,
//     required this.lastWkt,
//     required this.partnership,
//     required this.recentOvers,
//     required this.bowler,
//     required this.batsmen,
//     required this.toss,
//     required this.id,
//   });

//   factory MatchData.fromJson(Map<String, dynamic> json) {
//     return MatchData(
//       inningsNo: json['inningsNo'] ?? 0,
//       oversBowled: int.tryParse(json['oversBowled'].toString()) ?? 0,
//       runs: int.tryParse(json['runs'].toString()) ?? 0,
//       wickets: int.tryParse(json['wickets'].toString()) ?? 0,
//       fow: json['fow'] ?? [],
//       commentary: json['commentry'] ?? '',
//       summary: json['summury'] ?? '',
//       lastWkt: json['lastwkt'] ?? '',
//       partnership: Partnership.fromJson(json['partnerShip'] ?? {}),
//       recentOvers: (json['recentOvers'] as List?)
//               ?.map((e) => RecentOver.fromJson(e))
//               .toList() ??
//           [],
//       bowler: Bowler.fromJson(json['bowler'] ?? {}),
//       batsmen: (json['batsmen'] as List?)
//               ?.map((e) => Batsman.fromJson(e))
//               .toList() ??
//           [],
//       toss: Toss.fromJson(json['toss'] ?? {}),
//       id: json['id'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'inningsNo': inningsNo,
//       'oversBowled': oversBowled.toString(),
//       'runs': runs.toString(),
//       'wickets': wickets.toString(),
//       'fow': fow,
//       'commentry': commentary,
//       'summury': summary,
//       'lastwkt': lastWkt,
//       'partnerShip': partnership.toJson(),
//       'recentOvers': recentOvers.map((e) => e.toJson()).toList(),
//       'bowler': bowler.toJson(),
//       'batsmen': batsmen.map((e) => e.toJson()).toList(),
//       'toss': toss.toJson(),
//       'id': id,
//     };
//   }
// }

// class Partnership {
//   final int balls;
//   final int runs;

//   Partnership({required this.balls, required this.runs});

//   factory Partnership.fromJson(Map<String, dynamic> json) {
//     return Partnership(
//       balls: json['balls'] ?? 0,
//       runs: json['runs'] ?? 0,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'balls': balls,
//       'runs': runs,
//     };
//   }
// }

// class RecentOver {
//   final String bowler;
//   final List<String> batsmen;
//   final int number;
//   final int runs;
//   final int score;
//   final int wickets;
//   final List<Ball> balls;

//   RecentOver({
//     required this.bowler,
//     required this.batsmen,
//     required this.number,
//     required this.runs,
//     required this.score,
//     required this.wickets,
//     required this.balls,
//   });
//   factory RecentOver.fromJson(Map<String, dynamic> json) {
//     return RecentOver(
//       bowler: json['bowler'] ?? '',
//       batsmen: List<String>.from(json['batsmen'] ?? []),
//       number: json['number'] ?? 0,
//       runs: int.tryParse(json['runs'].toString()) ?? 0,
//       score: int.tryParse(json['score']?.toString() ?? '0') ?? 0,
//       wickets: int.tryParse(json['wickets'].toString()) ?? 0,
//       balls:
//           (json['balls'] as List?)?.map((e) => Ball.fromJson(e)).toList() ?? [],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'bowler': bowler,
//       'batsmen': batsmen,
//       'number': number,
//       'runs': runs.toString(),
//       'score': score.toString(),
//       'wickets': wickets.toString(),
//       'balls': balls.map((e) => e.toJson()).toList(),
//     };
//   }
// }

// class Ball {
//   final dynamic number;
//   final dynamic value;
//   final String type;

//   Ball({required this.number, required this.value, required this.type});

//   factory Ball.fromJson(Map<String, dynamic> json) {
//     return Ball(
//       number: json['number'],
//       value: json['value'],
//       type: json['type'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'number': number,
//       'value': value,
//       'type': type,
//     };
//   }
// }

// class Bowler {
//   final String name;
//   final dynamic overs;
//   final int maidens;
//   final int wickets;
//   final int bowlerRuns;
//   final double economy;

//   Bowler({
//     required this.name,
//     required this.overs,
//     required this.maidens,
//     required this.wickets,
//     required this.bowlerRuns,
//     required this.economy,
//   });

//   factory Bowler.fromJson(Map<String, dynamic> json) {
//     return Bowler(
//       name: json['name'],
//       overs: json['overs'],
//       maidens: json['maidens'],
//       wickets: json['wickets'],
//       bowlerRuns: json['bowlerRuns'],
//       economy: json['economy'].toDouble(),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'overs': overs,
//       'maidens': maidens,
//       'wickets': wickets,
//       'bowlerRuns': bowlerRuns,
//       'economy': economy,
//     };
//   }
// }

// class Batsman {
//   final String name;
//   final bool isOnStrike;
//   final int balls;
//   final int batsmanRuns;
//   final int fours;
//   final int sixes;
//   final double strikeRate;

//   Batsman({
//     required this.name,
//     required this.isOnStrike,
//     required this.balls,
//     required this.batsmanRuns,
//     required this.fours,
//     required this.sixes,
//     required this.strikeRate,
//   });

//   factory Batsman.fromJson(Map<String, dynamic> json) {
//     return Batsman(
//       name: json['name'] ?? '',
//       isOnStrike: json['isOnStrike'] ?? false,
//       balls: int.tryParse(json['balls'].toString()) ?? 0,
//       batsmanRuns: int.tryParse(json['batsmanRuns'].toString()) ?? 0,
//       fours: int.tryParse(json['fours'].toString()) ?? 0,
//       sixes: int.tryParse(json['sixes'].toString()) ?? 0,
//       strikeRate: double.tryParse(json['strikeRate'].toString()) ?? 0.0,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'isOnStrike': isOnStrike,
//       'balls': balls.toString(),
//       'batsmanRuns': batsmanRuns.toString(),
//       'fours': fours.toString(),
//       'sixes': sixes.toString(),
//       'strikeRate': strikeRate,
//     };
//   }
// }

// class Toss {
//   final String name;
//   final String decision;

//   Toss({required this.name, required this.decision});

//   factory Toss.fromJson(Map<String, dynamic> json) {
//     return Toss(
//       name: json['name'],
//       decision: json['decision'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'decision': decision,
//     };
//   }
// }
class GetScoreModel {
  final bool status;
  final List<ScoreData> data;

  GetScoreModel({
    required this.status,
    required this.data,
  });

  factory GetScoreModel.fromJson(Map<String, dynamic> json) {
    return GetScoreModel(
      status: json['status'] ?? false,
      data: (json['data'] as List<dynamic>)
          .map((dataJson) => ScoreData.fromJson(dataJson))
          .toList(),
    );
  }
}

class ScoreData {
  final String event;
  final int dob;
  final int maxAge;
  final ScoreDetails data;

  ScoreData({
    required this.event,
    required this.dob,
    required this.maxAge,
    required this.data,
  });

  factory ScoreData.fromJson(Map<String, dynamic> json) {
    return ScoreData(
      event: json['event'] ?? '',
      dob: json['_dob'] ?? 0,
      maxAge: json['_maxage'] ?? 0,
      data: ScoreDetails.fromJson(json['data']),
    );
  }
}

class ScoreDetails {
  final String action;
  final String message;
  final String responseCode;
  final ScoreCard score;

  ScoreDetails({
    required this.action,
    required this.message,
    required this.responseCode,
    required this.score,
  });

  factory ScoreDetails.fromJson(Map<String, dynamic> json) {
    return ScoreDetails(
      action: json['action'] ?? '',
      message: json['message'] ?? '',
      responseCode: json['response_code'] ?? '',
      score: ScoreCard.fromJson(json['score']),
    );
  }
}

class ScoreCard {
  final bool bettingSuspended;
  final String eventId;
  final int premiumCricketEventId;
  final int updateId;
  final int matchId;
  final String seriesName;
  final String matchTitle;
  final String matchCommentary;
  final int matchStatus;
  final int currentInningsNumber;
  final String timeStamp;
  final List<InningsData> innings;
  final List<OverData> recentOvers;
  final List<WormAndManhattan> wormAndManhattan;
  final List<BallBySummary> ballByBallSummaries;

  ScoreCard({
    required this.bettingSuspended,
    required this.eventId,
    required this.premiumCricketEventId,
    required this.updateId,
    required this.matchId,
    required this.seriesName,
    required this.matchTitle,
    required this.matchCommentary,
    required this.matchStatus,
    required this.currentInningsNumber,
    required this.timeStamp,
    required this.innings,
    required this.recentOvers,
    required this.wormAndManhattan,
    required this.ballByBallSummaries,
  });

  factory ScoreCard.fromJson(Map<String, dynamic> json) {
    return ScoreCard(
      bettingSuspended: json['bettingSuspended'] ?? false,
      eventId: json['eventId'] ?? '',
      premiumCricketEventId: json['premiumCricketEventId'] ?? 0,
      updateId: json['updateId'] ?? 0,
      matchId: json['matchId'] ?? 0,
      seriesName: json['seriesName'] ?? '',
      matchTitle: json['matchTitle'] ?? '',
      matchCommentary: json['matchCommentary'] ?? '',
      matchStatus: json['matchStatus'] ?? 0,
      currentInningsNumber: json['currentInningsNumber'] ?? 0,
      timeStamp: json['timeStamp'] ?? '',
      innings: (json['innings'] as List<dynamic>)
          .map((inningsJson) => InningsData.fromJson(inningsJson))
          .toList(),
      recentOvers: (json['recentOvers'] as List<dynamic>)
          .map((overJson) => OverData.fromJson(overJson))
          .toList(),
      wormAndManhattan: (json['wormAndManhattan'] as List<dynamic>)
          .map((wormJson) => WormAndManhattan.fromJson(wormJson))
          .toList(),
      ballByBallSummaries: (json['ballByBallSummaries'] as List<dynamic>)
          .map((summaryJson) => BallBySummary.fromJson(summaryJson))
          .toList(),
    );
  }
}

class InningsData {
  final int oversAvailable;
  final String teamName;
  final String conclusion;
  final String summary;
  final String competitorId;
  final bool isFollowOn;
  final bool isFinalInnings;
  final bool hasTarget;
  final int target;
  final ExtrasSummary extrasSummary;
  final String fallOfWickets;
  final List<BatsmanData> batsmen;
  final List<BowlerData> bowlers;
  final int inningsNumber;
  final int runs;
  final int wickets;
  final double overs;

  InningsData({
    required this.oversAvailable,
    required this.teamName,
    required this.conclusion,
    required this.summary,
    required this.competitorId,
    required this.isFollowOn,
    required this.isFinalInnings,
    required this.hasTarget,
    required this.target,
    required this.extrasSummary,
    required this.fallOfWickets,
    required this.batsmen,
    required this.bowlers,
    required this.inningsNumber,
    required this.runs,
    required this.wickets,
    required this.overs,
  });

  factory InningsData.fromJson(Map<String, dynamic> json) {
    return InningsData(
      oversAvailable: json['oversAvailable'] ?? 0,
      teamName: json['teamName'] ?? '',
      conclusion: json['conclusion'] ?? '',
      summary: json['summary'] ?? '',
      competitorId: json['competitorId'] ?? '',
      isFollowOn: json['isFollowOn'] ?? false,
      isFinalInnings: json['isFinalInnings'] ?? false,
      hasTarget: json['hasTarget'] ?? false,
      target: json['target'] ?? 0,
      extrasSummary: ExtrasSummary.fromJson(json['extrasSummary'] ?? {}),
      fallOfWickets: json['fallOfwickets'] ?? '',
      batsmen: (json['batsmen'] as List<dynamic>)
          .map((batsmanJson) => BatsmanData.fromJson(batsmanJson))
          .toList(),
      bowlers: (json['bowlers'] as List<dynamic>)
          .map((bowlerJson) => BowlerData.fromJson(bowlerJson))
          .toList(),
      inningsNumber: json['inningsNumber'] ?? 0,
      runs: json['runs'] ?? 0,
      wickets: json['wickets'] ?? 0,
      overs: json['overs'] != null
          ? double.tryParse(json['overs'].toString()) ?? 0.0
          : 0.0,
    );
  }
}

class ExtrasSummary {
  final int byes;
  final int noBalls;
  final int legByes;
  final int wides;
  final int penalties;

  ExtrasSummary({
    required this.byes,
    required this.noBalls,
    required this.legByes,
    required this.wides,
    required this.penalties,
  });

  factory ExtrasSummary.fromJson(Map<String, dynamic> json) {
    return ExtrasSummary(
      byes: json['byes'] ?? 0,
      noBalls: json['noBalls'] ?? 0,
      legByes: json['legByes'] ?? 0,
      wides: json['wides'] ?? 0,
      penalties: json['penalties'] ?? 0,
    );
  }
}

class BatsmanData {
  final String description;
  final bool toCome;
  final bool didNotBat;
  final String? fielderId;
  final String? fielderName;
  final String? bowlerId;
  final String? bowlerName;
  final String? description2;
  final String batsmanName;
  final bool active;
  final bool onStrike;
  final int fours;
  final int sixes;
  final int runs;
  final int balls;
  final String playerId;

  BatsmanData({
    required this.description,
    required this.toCome,
    required this.didNotBat,
    this.fielderId,
    this.fielderName,
    this.bowlerId,
    this.bowlerName,
    this.description2,
    required this.batsmanName,
    required this.active,
    required this.onStrike,
    required this.fours,
    required this.sixes,
    required this.runs,
    required this.balls,
    required this.playerId,
  });

  factory BatsmanData.fromJson(Map<String, dynamic> json) {
    return BatsmanData(
      description: json['description'] ?? '',
      toCome: json['toCome'] ?? false,
      didNotBat: json['didNotBat'] ?? false,
      fielderId: json['fielderId'],
      fielderName: json['fielderName'],
      bowlerId: json['bowlerId'],
      bowlerName: json['bowlerName'],
      description2: json['description2'],
      batsmanName: json['batsmanName'] ?? '',
      active: json['active'] ?? false,
      onStrike: json['onStrike'] ?? false,
      fours: json['fours'] ?? 0,
      sixes: json['sixes'] ?? 0,
      runs: json['runs'] ?? 0,
      balls: json['balls'] ?? 0,
      playerId: json['playerId'] ?? '',
    );
  }
}

class BowlerData {
  final String bowlerName;
  final String playerId;
  final int overs;
  final int balls;
  final int maidens;
  final int runs;
  final int wickets;
  final int wides;
  final int noBalls;
  final bool isActiveBowler;
  final int fours;
  final int sixes;
  final int dotBalls;
  final bool isOtherBowler;

  BowlerData({
    required this.bowlerName,
    required this.playerId,
    required this.overs,
    required this.balls,
    required this.maidens,
    required this.runs,
    required this.wickets,
    required this.wides,
    required this.noBalls,
    required this.isActiveBowler,
    required this.fours,
    required this.sixes,
    required this.dotBalls,
    required this.isOtherBowler,
  });

  factory BowlerData.fromJson(Map<String, dynamic> json) {
    return BowlerData(
      bowlerName: json['bowlerName'] ?? '',
      playerId: json['playerId'] ?? '',
      overs: json['overs'] ?? 0,
      balls: json['balls'] ?? 0,
      maidens: json['maidens'] ?? 0,
      runs: json['runs'] ?? 0,
      wickets: json['wickets'] ?? 0,
      wides: json['wides'] ?? 0,
      noBalls: json['noBalls'] ?? 0,
      isActiveBowler: json['isActiveBowler'] ?? false,
      fours: json['fours'] ?? 0,
      sixes: json['sixes'] ?? 0,
      dotBalls: json['dotBalls'] ?? 0,
      isOtherBowler: json['isOtherBowler'] ?? false,
    );
  }
}

class OverData {
  final int overNumber;
  final int runs;
  final bool isCurrentOver;
  final List<String> balls;

  OverData({
    required this.overNumber,
    required this.runs,
    required this.isCurrentOver,
    required this.balls,
  });

  factory OverData.fromJson(Map<String, dynamic> json) {
    return OverData(
      overNumber: json['overNumber'] ?? 0,
      runs: json['runs'] ?? 0,
      isCurrentOver: json['isCurrentOver'] ?? false,
      balls: List<String>.from(json['balls'] ?? []),
    );
  }
}

class WormAndManhattan {
  final int overNumber;
  final String firstInnings;
  final String secondInnings;
  final String thirdInnings;
  final String fourthInnings;

  WormAndManhattan({
    required this.overNumber,
    required this.firstInnings,
    required this.secondInnings,
    required this.thirdInnings,
    required this.fourthInnings,
  });

  factory WormAndManhattan.fromJson(Map<String, dynamic> json) {
    return WormAndManhattan(
      overNumber: json['overNumber'] ?? 0,
      firstInnings: json['firstInnings'] ?? '',
      secondInnings: json['secondInnings'] ?? '',
      thirdInnings: json['thirdInnings'] ?? '',
      fourthInnings: json['fourthInnings'] ?? '',
    );
  }
}

class BallBySummary {
  final int overNumber;
  final String firstInnings;
  final String secondInnings;
  final String thirdInnings;
  final String fourthInnings;

  BallBySummary({
    required this.overNumber,
    required this.firstInnings,
    required this.secondInnings,
    required this.thirdInnings,
    required this.fourthInnings,
  });

  factory BallBySummary.fromJson(Map<String, dynamic> json) {
    return BallBySummary(
      overNumber: json['overNumber'] ?? 0,
      firstInnings: json['firstInnings'] ?? '',
      secondInnings: json['secondInnings'] ?? '',
      thirdInnings: json['thirdInnings'] ?? '',
      fourthInnings: json['fourthInnings'] ?? '',
    );
  }
}
