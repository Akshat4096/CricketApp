// class FetchLiveEventsModel {
//   bool? status;
//   List<EventData>? data;

//   FetchLiveEventsModel({this.status, this.data});

//   FetchLiveEventsModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['data'] != null) {
//       data = <EventData>[];
//       json['data'].forEach((v) {
//         data!.add(EventData.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class EventData {
//   bool? isFancy;
//   bool? isBm;
//   bool? isPremium;
//   String? sportsName;
//   String? sportId;
//   String? competitionName;
//   double? totalMatched;
//   int? port;
//   String? time;
//   int? isInPlay;
//   String? eventTypeId;
//   int? competitionId;
//   int? eventId;
//   String? eventName;
//   List<Markets>? markets;
//   int? gameId;
//   int? fancyInplay;
//   int? premiumInplay;
//   int? winTheTossInplay;
//   int? winTheTossInplay1;
//   int? bookmakerInplay;
//   int? bookmakerInplaySource0;
//   int? bookmakerInplaySource1;
//   int? tiedMatchInplay;
//   int? tiedMatchInplay1;
//   int? overUnderInplay;
//   int? overUnderInplay1;
//   int? matchOddsInplay;
//   int? matchOddsInplay1;
//   int? superOverInplay;
//   bool? isManualInplay;
//   int? minBeforeInplay;
//   bool? isStream;
//   int? premiumMain;

//   EventData(
//       {this.isFancy,
//       this.isBm,
//       this.isPremium,
//       this.sportsName,
//       this.sportId,
//       this.competitionName,
//       this.totalMatched,
//       this.port,
//       this.time,
//       this.isInPlay,
//       this.eventTypeId,
//       this.competitionId,
//       this.eventId,
//       this.eventName,
//       this.markets,
//       this.gameId,
//       this.fancyInplay,
//       this.premiumInplay,
//       this.winTheTossInplay,
//       this.winTheTossInplay1,
//       this.bookmakerInplay,
//       this.bookmakerInplaySource0,
//       this.bookmakerInplaySource1,
//       this.tiedMatchInplay,
//       this.tiedMatchInplay1,
//       this.overUnderInplay,
//       this.overUnderInplay1,
//       this.matchOddsInplay,
//       this.matchOddsInplay1,
//       this.superOverInplay,
//       this.isManualInplay,
//       this.minBeforeInplay,
//       this.isStream,
//       this.premiumMain});

//   EventData.fromJson(Map<String, dynamic> json) {
//     isFancy = json['isFancy'];
//     isBm = json['isBm'];
//     isPremium = json['isPremium'];
//     sportsName = json['sportsName'];
//     sportId = json['sportId'];
//     competitionName = json['competitionName'];
//     totalMatched = json['totalMatched'];
//     port = json['port'];
//     time = json['time'];
//     isInPlay = json['isInPlay'];
//     eventTypeId = json['eventTypeId'];
//     competitionId = json['competitionId'];
//     eventId = json['eventId'];
//     eventName = json['eventName'];
//     if (json['markets'] != null) {
//       markets = <Markets>[];
//       json['markets'].forEach((v) {
//         markets!.add(Markets.fromJson(v));
//       });
//     }
//     gameId = json['gameId'];
//     fancyInplay = json['fancyInplay'];
//     premiumInplay = json['premiumInplay'];
//     winTheTossInplay = json['winTheTossInplay'];
//     winTheTossInplay1 = json['winTheTossInplay1'];
//     bookmakerInplay = json['bookmakerInplay'];
//     bookmakerInplaySource0 = json['bookmakerInplay_source0'];
//     bookmakerInplaySource1 = json['bookmakerInplay_source1'];
//     tiedMatchInplay = json['tiedMatchInplay'];
//     tiedMatchInplay1 = json['tiedMatchInplay1'];
//     overUnderInplay = json['overUnderInplay'];
//     overUnderInplay1 = json['overUnderInplay1'];
//     matchOddsInplay = json['matchOddsInplay'];
//     matchOddsInplay1 = json['matchOddsInplay1'];
//     superOverInplay = json['superOverInplay'];
//     isManualInplay = json['isManualInplay'];
//     minBeforeInplay = json['minBeforeInplay'];
//     isStream = json['isStream'];
//     premiumMain = json['premiumMain'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['isFancy'] = isFancy;
//     data['isBm'] = isBm;
//     data['isPremium'] = isPremium;
//     data['sportsName'] = sportsName;
//     data['sportId'] = sportId;
//     data['competitionName'] = competitionName;
//     data['totalMatched'] = totalMatched;
//     data['port'] = port;
//     data['time'] = time;
//     data['isInPlay'] = isInPlay;
//     data['eventTypeId'] = eventTypeId;
//     data['competitionId'] = competitionId;
//     data['eventId'] = eventId;
//     data['eventName'] = eventName;
//     if (markets != null) {
//       data['markets'] = markets!.map((v) => v.toJson()).toList();
//     }
//     data['gameId'] = gameId;
//     data['fancyInplay'] = fancyInplay;
//     data['premiumInplay'] = premiumInplay;
//     data['winTheTossInplay'] = winTheTossInplay;
//     data['winTheTossInplay1'] = winTheTossInplay1;
//     data['bookmakerInplay'] = bookmakerInplay;
//     data['bookmakerInplay_source0'] = bookmakerInplaySource0;
//     data['bookmakerInplay_source1'] = bookmakerInplaySource1;
//     data['tiedMatchInplay'] = tiedMatchInplay;
//     data['tiedMatchInplay1'] = tiedMatchInplay1;
//     data['overUnderInplay'] = overUnderInplay;
//     data['overUnderInplay1'] = overUnderInplay1;
//     data['matchOddsInplay'] = matchOddsInplay;
//     data['matchOddsInplay1'] = matchOddsInplay1;
//     data['superOverInplay'] = superOverInplay;
//     data['isManualInplay'] = isManualInplay;
//     data['minBeforeInplay'] = minBeforeInplay;
//     data['isStream'] = isStream;
//     data['premiumMain'] = premiumMain;
//     return data;
//   }
// }

// class Markets {
//   String? marketName;
//   int? gameId;
//   String? marketId;
//   List<Runners>? runners;
//   int? open;
//   int? status;
//   int? isInPlay;
//   int? betDelay;

//   Markets(
//       {this.marketName,
//       this.gameId,
//       this.marketId,
//       this.runners,
//       this.open,
//       this.status,
//       this.isInPlay,
//       this.betDelay});

//   Markets.fromJson(Map<String, dynamic> json) {
//     marketName = json['marketName'];
//     gameId = json['gameId'];
//     marketId = json['marketId'];
//     if (json['runners'] != null) {
//       runners = <Runners>[];
//       json['runners'].forEach((v) {
//         runners!.add(Runners.fromJson(v));
//       });
//     }
//     open = json['open'];
//     status = json['status'];
//     isInPlay = json['isInPlay'];
//     betDelay = json['betDelay'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['marketName'] = marketName;
//     data['gameId'] = gameId;
//     data['marketId'] = marketId;
//     if (runners != null) {
//       data['runners'] = runners!.map((v) => v.toJson()).toList();
//     }
//     data['open'] = open;
//     data['status'] = status;
//     data['isInPlay'] = isInPlay;
//     data['betDelay'] = betDelay;
//     return data;
//   }
// }

// class Runners {
//   String? selectionName;
//   String? selectionId;
//   bool? lockBackBets;
//   bool? lockLayBets;

//   Runners(
//       {this.selectionName,
//       this.selectionId,
//       this.lockBackBets,
//       this.lockLayBets});

//   Runners.fromJson(Map<String, dynamic> json) {
//     selectionName = json['selectionName'];
//     selectionId = json['selectionId'];
//     lockBackBets = json['lockBackBets'];
//     lockLayBets = json['lockLayBets'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['selectionName'] = selectionName;
//     data['selectionId'] = selectionId;
//     data['lockBackBets'] = lockBackBets;
//     data['lockLayBets'] = lockLayBets;
//     return data;
//   }
// }

class FetchLiveEventsModel {
  final int? totalCount;
  final List<EventData>? data;

  FetchLiveEventsModel({
    this.totalCount,
    this.data,
  });

  factory FetchLiveEventsModel.fromJson(Map<String, dynamic>? json) {
    return FetchLiveEventsModel(
      totalCount: json?['totalCount'] as int? ?? 0,
      data: (json?['data'] as List?)
              ?.map((e) => EventData.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalCount': totalCount,
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class EventData {
  final int? id;
  final String? sportName;
  final String? sportId;
  final String? competitionName;
  final String? competitionId;
  final String? name;
  final String? matchId;
  final String? scoreId;
  final dynamic? eventDatetime;
  final int? eventType;
  final bool? status;
  final MatchData? matchData;

  EventData({
    this.id,
    this.sportName,
    this.sportId,
    this.competitionName,
    this.competitionId,
    this.name,
    this.matchId,
    this.scoreId,
    this.eventDatetime,
    this.eventType,
    this.status,
    this.matchData,
  }) ;

  factory EventData.fromJson(Map<String, dynamic>? json) {
    return EventData(
      id: json?['id'] as int? ?? 0,
      sportName: json?['sport_name'] as String? ?? '',
      sportId: json?['sport_id'] as String? ?? '',
      competitionName: json?['competition_name'] as String? ?? '',
      competitionId: json?['competition_id'] as String? ?? '',
      name: json?['name'] as String? ?? '',
      matchId: json?['match_id'] as String? ?? '',
      scoreId: json?['score_id'] as String? ?? '',
      eventDatetime: json?['event_datetime'],
      eventType: json?['event_type'] as int? ?? 0,
      status: json?['status'] as bool? ?? false,
      matchData: json?['match_data'] != null
          ? MatchData.fromJson(json?['match_data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sport_name': sportName,
      'sport_id': sportId,
      'competition_name': competitionName,
      'competition_id': competitionId,
      'name': name,
      'match_id': matchId,
      'score_id': scoreId,
      'event_datetime': eventDatetime,
      'event_type': eventType,
      'status': status,
      'match_data': matchData?.toJson(),
    };
  }
}

class MatchData {
  final bool? isBm;
  final int? port;
  final String? time;
  final int? gameId;
  final int? eventId;
  final bool? isFancy;
  final List<Market>? markets;
  final String? sportId;
  final int? isInPlay;
  final bool? isStream;
  final String? eventName;
  final bool? isPremium;
  final String? sportsName;
  final String? eventTypeId;
  final int? fancyInplay;
  final int? premiumMain;
  final double? totalMatched;
  final int? competitionId;
  final int? premiumInplay;
  final bool? isManualInplay;
  final int? bookmakerInplay;
  final String? competitionName;
  final int? matchOddsInplay;
  final int? minBeforeInplay;
  final int? overUnderInplay;
  final int? superOverInplay;
  final int? tiedMatchInplay;
  final int? matchOddsInplay1;
  final int? overUnderInplay1;
  final int? tiedMatchInplay1;
  final int? winTheTossInplay;
  final int? winTheTossInplay1;
  final int? bookmakerInplaySource0;
  final int? bookmakerInplaySource1;

  MatchData({
    this.isBm,
    this.port,
    this.time,
    this.gameId,
    this.eventId,
   this.isFancy,
   this.markets,
   this.sportId,
    this.isInPlay,
    this.isStream,
    this.eventName,
    this.isPremium,
    this.sportsName,
    this.eventTypeId,
   this.fancyInplay,
   this.premiumMain,
    this.totalMatched,
    this.competitionId,
    this.premiumInplay,
    this. isManualInplay,
    this.bookmakerInplay,
   this.competitionName,
    this.matchOddsInplay,
    this.minBeforeInplay,
    this.overUnderInplay,
    this.superOverInplay,
    this.tiedMatchInplay,
    this.matchOddsInplay1,
   this.overUnderInplay1,
    this.tiedMatchInplay1,
    this.winTheTossInplay,
    this.winTheTossInplay1,
    this.bookmakerInplaySource0,
    this.bookmakerInplaySource1,
  });

  factory MatchData.fromJson(Map<String, dynamic>? json) {
    return MatchData(
      isBm: json?['isBm'] as bool? ?? false,
      port: json?['port'] as int? ?? 0,
      time: json?['time'] as String? ?? '2025-03-18T00:00:00Z',
      gameId: json?['gameId'] as int? ?? 0,
      eventId: json?['eventId'] as int? ?? 0,
      isFancy: json?['isFancy'] as bool? ?? false,
      markets: (json?['markets'] as List?)
              ?.map((e) => Market.fromJson(e))
              .toList() ??
          [],
      sportId: json?['sportId'] as String? ?? '',
      isInPlay: json?['isInPlay'] as int? ?? 0,
      isStream: json?['isStream'] as bool? ?? false,
      eventName: json?['eventName'] as String? ?? '',
      isPremium: json?['isPremium'] as bool? ?? false,
      sportsName: json?['sportsName'] as String? ?? '',
      eventTypeId: json?['eventTypeId'] as String? ?? '',
      fancyInplay: json?['fancyInplay'] as int? ?? 0,
      premiumMain: json?['premiumMain'] as int? ?? 0,
      totalMatched: json?['totalMatched'] as double? ?? 0.0,
      competitionId: json?['competitionId'] as int? ?? 0,
      premiumInplay: json?['premiumInplay'] as int? ?? 0,
      isManualInplay: json?['isManualInplay'] as bool? ?? false,
      bookmakerInplay: json?['bookmakerInplay'] as int? ?? 0,
      competitionName: json?['competitionName'] as String? ?? '',
      matchOddsInplay: json?['matchOddsInplay'] as int? ?? 0,
      minBeforeInplay: json?['minBeforeInplay'] as int? ?? 0,
      overUnderInplay: json?['overUnderInplay'] as int? ?? 0,
      superOverInplay: json?['superOverInplay'] as int? ?? 0,
      tiedMatchInplay: json?['tiedMatchInplay'] as int? ?? 0,
      matchOddsInplay1: json?['matchOddsInplay1'] as int? ?? 0,
      overUnderInplay1: json?['overUnderInplay1'] as int? ?? 0,
      tiedMatchInplay1: json?['tiedMatchInplay1'] as int? ?? 0,
      winTheTossInplay: json?['winTheTossInplay'] as int? ?? 0,
      winTheTossInplay1: json?['winTheTossInplay1'] as int? ?? 0,
      bookmakerInplaySource0: json?['bookmakerInplay_source0'] as int? ?? 0,
      bookmakerInplaySource1: json?['bookmakerInplay_source1'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isBm': isBm,
      'port': port,
      'time': time,
      'gameId': gameId,
      'eventId': eventId,
      'isFancy': isFancy,
      'markets': markets?.map((e) => e.toJson()).toList(),
      'sportId': sportId,
      'isInPlay': isInPlay,
      'isStream': isStream,
      'eventName': eventName,
      'isPremium': isPremium,
      'sportsName': sportsName,
      'eventTypeId': eventTypeId,
      'fancyInplay': fancyInplay,
      'premiumMain': premiumMain,
      'totalMatched': totalMatched,
      'competitionId': competitionId,
      'premiumInplay': premiumInplay,
      'isManualInplay': isManualInplay,
      'bookmakerInplay': bookmakerInplay,
      'competitionName': competitionName,
      'matchOddsInplay': matchOddsInplay,
      'minBeforeInplay': minBeforeInplay,
      'overUnderInplay': overUnderInplay,
      'superOverInplay': superOverInplay,
      'tiedMatchInplay': tiedMatchInplay,
      'matchOddsInplay1': matchOddsInplay1,
      'overUnderInplay1': overUnderInplay1,
      'tiedMatchInplay1': tiedMatchInplay1,
      'winTheTossInplay': winTheTossInplay,
      'winTheTossInplay1': winTheTossInplay1,
      'bookmakerInplay_source0': bookmakerInplaySource0,
      'bookmakerInplay_source1': bookmakerInplaySource1,
    };
  }
}

class Market {
  final int? open;
  final int? gameId;
  final int? status;
  final List<Runner>? runners;
  final int? betDelay;
  final int? isInPlay;
  final String? marketId;
  final String? marketName;

  Market({
    this.open,
    this.gameId,
    this.status,
    this.runners,
    this.betDelay,
    this.isInPlay,
   this.marketId,
    this.marketName,
  }) ;

  factory Market.fromJson(Map<String, dynamic>? json) {
    return Market(
      open: json?['open'] as int? ?? 0,
      gameId: json?['gameId'] as int? ?? 0,
      status: json?['status'] as int? ?? 0,
      runners: (json?['runners'] as List?)
              ?.map((e) => Runner.fromJson(e))
              .toList() ??
          [],
      betDelay: json?['betDelay'] as int? ?? 0,
      isInPlay: json?['isInPlay'] as int? ?? 0,
      marketId: json?['marketId'] as String? ?? '',
      marketName: json?['marketName'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'open': open,
      'gameId': gameId,
      'status': status,
      'runners': runners?.map((e) => e.toJson()).toList(),
      'betDelay': betDelay,
      'isInPlay': isInPlay,
      'marketId': marketId,
      'marketName': marketName,
    };
  }
}

class Runner {
  final bool? lockLayBets;
  final String? selectionId;
  final bool? lockBackBets;
  final String? selectionName;

  Runner({
    this.lockLayBets,
    this.selectionId,
    this.lockBackBets,
    this.selectionName,
  });

  factory Runner.fromJson(Map<String, dynamic>? json) {
    return Runner(
      lockLayBets: json?['lockLayBets'] as bool? ?? false,
      selectionId: json?['selectionId'] as String? ?? '',
      lockBackBets: json?['lockBackBets'] as bool? ?? false,
      selectionName: json?['selectionName'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lockLayBets': lockLayBets,
      'selectionId': selectionId,
      'lockBackBets': lockBackBets,
      'selectionName': selectionName,
    };
  }
}
