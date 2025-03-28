class FetchEventsModel {
  bool? status;
  List<EventData>? data;

  FetchEventsModel({this.status, this.data});

  FetchEventsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <EventData>[];
      json['data'].forEach((v) {
        data!.add(EventData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EventData {
  bool? isFancy;
  bool? isBm;
  bool? isPremium;
  String? sportsName;
  String? sportId;
  String? competitionName;
  double? totalMatched;
  int? port;
  String? time;
  int? isInPlay;
  String? eventTypeId;
  int? competitionId;
  int? eventId;
  String? eventName;
  List<Markets>? markets;
  int? gameId;
  int? fancyInplay;
  int? premiumInplay;
  int? winTheTossInplay;
  int? winTheTossInplay1;
  int? bookmakerInplay;
  int? bookmakerInplaySource0;
  int? bookmakerInplaySource1;
  int? tiedMatchInplay;
  int? tiedMatchInplay1;
  int? overUnderInplay;
  int? overUnderInplay1;
  int? matchOddsInplay;
  int? matchOddsInplay1;
  int? superOverInplay;
  bool? isManualInplay;
  int? minBeforeInplay;
  bool? isStream;
  int? premiumMain;

  EventData(
      {this.isFancy,
      this.isBm,
      this.isPremium,
      this.sportsName,
      this.sportId,
      this.competitionName,
      this.totalMatched,
      this.port,
      this.time,
      this.isInPlay,
      this.eventTypeId,
      this.competitionId,
      this.eventId,
      this.eventName,
      this.markets,
      this.gameId,
      this.fancyInplay,
      this.premiumInplay,
      this.winTheTossInplay,
      this.winTheTossInplay1,
      this.bookmakerInplay,
      this.bookmakerInplaySource0,
      this.bookmakerInplaySource1,
      this.tiedMatchInplay,
      this.tiedMatchInplay1,
      this.overUnderInplay,
      this.overUnderInplay1,
      this.matchOddsInplay,
      this.matchOddsInplay1,
      this.superOverInplay,
      this.isManualInplay,
      this.minBeforeInplay,
      this.isStream,
      this.premiumMain});

  EventData.fromJson(Map<String, dynamic> json) {
    isFancy = json['isFancy'];
    isBm = json['isBm'];
    isPremium = json['isPremium'];
    sportsName = json['sportsName'];
    sportId = json['sportId'];
    competitionName = json['competitionName'];
    totalMatched = json['totalMatched'];
    port = json['port'];
    time = json['time'];
    isInPlay = json['isInPlay'];
    eventTypeId = json['eventTypeId'];
    competitionId = json['competitionId'];
    eventId = json['eventId'];
    eventName = json['eventName'];
    if (json['markets'] != null) {
      markets = <Markets>[];
      json['markets'].forEach((v) {
        markets!.add(Markets.fromJson(v));
      });
    }
    gameId = json['gameId'];
    fancyInplay = json['fancyInplay'];
    premiumInplay = json['premiumInplay'];
    winTheTossInplay = json['winTheTossInplay'];
    winTheTossInplay1 = json['winTheTossInplay1'];
    bookmakerInplay = json['bookmakerInplay'];
    bookmakerInplaySource0 = json['bookmakerInplay_source0'];
    bookmakerInplaySource1 = json['bookmakerInplay_source1'];
    tiedMatchInplay = json['tiedMatchInplay'];
    tiedMatchInplay1 = json['tiedMatchInplay1'];
    overUnderInplay = json['overUnderInplay'];
    overUnderInplay1 = json['overUnderInplay1'];
    matchOddsInplay = json['matchOddsInplay'];
    matchOddsInplay1 = json['matchOddsInplay1'];
    superOverInplay = json['superOverInplay'];
    isManualInplay = json['isManualInplay'];
    minBeforeInplay = json['minBeforeInplay'];
    isStream = json['isStream'];
    premiumMain = json['premiumMain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isFancy'] = isFancy;
    data['isBm'] = isBm;
    data['isPremium'] = isPremium;
    data['sportsName'] = sportsName;
    data['sportId'] = sportId;
    data['competitionName'] = competitionName;
    data['totalMatched'] = totalMatched;
    data['port'] = port;
    data['time'] = time;
    data['isInPlay'] = isInPlay;
    data['eventTypeId'] = eventTypeId;
    data['competitionId'] = competitionId;
    data['eventId'] = eventId;
    data['eventName'] = eventName;
    if (markets != null) {
      data['markets'] = markets!.map((v) => v.toJson()).toList();
    }
    data['gameId'] = gameId;
    data['fancyInplay'] = fancyInplay;
    data['premiumInplay'] = premiumInplay;
    data['winTheTossInplay'] = winTheTossInplay;
    data['winTheTossInplay1'] = winTheTossInplay1;
    data['bookmakerInplay'] = bookmakerInplay;
    data['bookmakerInplay_source0'] = bookmakerInplaySource0;
    data['bookmakerInplay_source1'] = bookmakerInplaySource1;
    data['tiedMatchInplay'] = tiedMatchInplay;
    data['tiedMatchInplay1'] = tiedMatchInplay1;
    data['overUnderInplay'] = overUnderInplay;
    data['overUnderInplay1'] = overUnderInplay1;
    data['matchOddsInplay'] = matchOddsInplay;
    data['matchOddsInplay1'] = matchOddsInplay1;
    data['superOverInplay'] = superOverInplay;
    data['isManualInplay'] = isManualInplay;
    data['minBeforeInplay'] = minBeforeInplay;
    data['isStream'] = isStream;
    data['premiumMain'] = premiumMain;
    return data;
  }
}

class Markets {
  String? marketName;
  int? gameId;
  String? marketId;
  List<Runners>? runners;
  int? open;
  int? status;
  int? isInPlay;
  int? betDelay;

  Markets(
      {this.marketName,
      this.gameId,
      this.marketId,
      this.runners,
      this.open,
      this.status,
      this.isInPlay,
      this.betDelay});

  Markets.fromJson(Map<String, dynamic> json) {
    marketName = json['marketName'];
    gameId = json['gameId'];
    marketId = json['marketId'];
    if (json['runners'] != null) {
      runners = <Runners>[];
      json['runners'].forEach((v) {
        runners!.add(Runners.fromJson(v));
      });
    }
    open = json['open'];
    status = json['status'];
    isInPlay = json['isInPlay'];
    betDelay = json['betDelay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['marketName'] = marketName;
    data['gameId'] = gameId;
    data['marketId'] = marketId;
    if (runners != null) {
      data['runners'] = runners!.map((v) => v.toJson()).toList();
    }
    data['open'] = open;
    data['status'] = status;
    data['isInPlay'] = isInPlay;
    data['betDelay'] = betDelay;
    return data;
  }
}

class Runners {
  String? selectionName;
  String? selectionId;
  bool? lockBackBets;
  bool? lockLayBets;

  Runners(
      {this.selectionName,
      this.selectionId,
      this.lockBackBets,
      this.lockLayBets});

  Runners.fromJson(Map<String, dynamic> json) {
    selectionName = json['selectionName'];
    selectionId = json['selectionId'];
    lockBackBets = json['lockBackBets'];
    lockLayBets = json['lockLayBets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['selectionName'] = selectionName;
    data['selectionId'] = selectionId;
    data['lockBackBets'] = lockBackBets;
    data['lockLayBets'] = lockLayBets;
    return data;
  }
}
