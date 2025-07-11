// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

// import 'dart:convert';
//
// List<Country> countryFromJson(String str) => List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));
//
// String countryToJson(List<Country> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class Country {
//   Country({
//     required this.updated,
//     required this.country,
//     required this.countryInfo,
//     required this.cases,
//     required this.todayCases,
//     required this.deaths,
//     required this.todayDeaths,
//     required this.recovered,
//     required this.todayRecovered,
//     required this.active,
//     required this.critical,
//     required this.casesPerOneMillion,
//     required this.deathsPerOneMillion,
//     required this.tests,
//     required this.testsPerOneMillion,
//     required this.population,
//     required this.continent,
//     required this.oneCasePerPeople,
//     required this.oneDeathPerPeople,
//     required this.oneTestPerPeople,
//     required this.activePerOneMillion,
//     required this.recoveredPerOneMillion,
//     required this.criticalPerOneMillion,
//   });
//
//   int updated;
//   String country;
//   CountryInfo countryInfo;
//   int cases;
//   int todayCases;
//   int deaths;
//   int todayDeaths;
//   int recovered;
//   int todayRecovered;
//   int active;
//   int critical;
//   int casesPerOneMillion;
//   int deathsPerOneMillion;
//   int tests;
//   int testsPerOneMillion;
//   int population;
//   Continent continent;
//   int oneCasePerPeople;
//   int oneDeathPerPeople;
//   int oneTestPerPeople;
//   double activePerOneMillion;
//   double recoveredPerOneMillion;
//   double criticalPerOneMillion;
//
//   factory Country.fromJson(Map<String, dynamic> json) => Country(
//     updated: json["updated"],
//     country: json["country"],
//     countryInfo: CountryInfo.fromJson(json["countryInfo"]),
//     cases: json["cases"],
//     todayCases: json["todayCases"],
//     deaths: json["deaths"],
//     todayDeaths: json["todayDeaths"],
//     recovered: json["recovered"],
//     todayRecovered: json["todayRecovered"],
//     active: json["active"],
//     critical: json["critical"],
//     casesPerOneMillion: json["casesPerOneMillion"],
//     deathsPerOneMillion: json["deathsPerOneMillion"],
//     tests: json["tests"],
//     testsPerOneMillion: json["testsPerOneMillion"],
//     population: json["population"],
//     continent: continentValues.map[json["continent"]]!,
//     oneCasePerPeople: json["oneCasePerPeople"],
//     oneDeathPerPeople: json["oneDeathPerPeople"],
//     oneTestPerPeople: json["oneTestPerPeople"],
//     activePerOneMillion: json["activePerOneMillion"]?.toDouble(),
//     recoveredPerOneMillion: json["recoveredPerOneMillion"]?.toDouble(),
//     criticalPerOneMillion: json["criticalPerOneMillion"]?.toDouble(),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "updated": updated,
//     "country": country,
//     "countryInfo": countryInfo.toJson(),
//     "cases": cases,
//     "todayCases": todayCases,
//     "deaths": deaths,
//     "todayDeaths": todayDeaths,
//     "recovered": recovered,
//     "todayRecovered": todayRecovered,
//     "active": active,
//     "critical": critical,
//     "casesPerOneMillion": casesPerOneMillion,
//     "deathsPerOneMillion": deathsPerOneMillion,
//     "tests": tests,
//     "testsPerOneMillion": testsPerOneMillion,
//     "population": population,
//     "continent": continentValues.reverse[continent],
//     "oneCasePerPeople": oneCasePerPeople,
//     "oneDeathPerPeople": oneDeathPerPeople,
//     "oneTestPerPeople": oneTestPerPeople,
//     "activePerOneMillion": activePerOneMillion,
//     "recoveredPerOneMillion": recoveredPerOneMillion,
//     "criticalPerOneMillion": criticalPerOneMillion,
//   };
// }
//
// enum Continent { ASIA, EUROPE, AFRICA, NORTH_AMERICA, SOUTH_AMERICA, AUSTRALIA_OCEANIA, EMPTY }
//
// final continentValues = EnumValues({
//   "Africa": Continent.AFRICA,
//   "Asia": Continent.ASIA,
//   "Australia-Oceania": Continent.AUSTRALIA_OCEANIA,
//   "": Continent.EMPTY,
//   "Europe": Continent.EUROPE,
//   "North America": Continent.NORTH_AMERICA,
//   "South America": Continent.SOUTH_AMERICA
// });
//
// class CountryInfo {
//   CountryInfo({
//     this.id,
//     this.iso2,
//     this.iso3,
//     required this.lat,
//     required this.long,
//     required this.flag,
//   });
//
//   int? id;
//   String? iso2;
//   String? iso3;
//   double lat;
//   double long;
//   String flag;
//
//   factory CountryInfo.fromJson(Map<String, dynamic> json) => CountryInfo(
//     id: json["_id"],
//     iso2: json["iso2"],
//     iso3: json["iso3"],
//     lat: json["lat"]?.toDouble(),
//     long: json["long"]?.toDouble(),
//     flag: json["flag"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "iso2": iso2,
//     "iso3": iso3,
//     "lat": lat,
//     "long": long,
//     "flag": flag,
//   };
// }
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }


import 'dart:convert';

List<Country> countryFromJson(String str) => List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

String countryToJson(List<Country> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Country {
  int? updated;
  String? country;
  CountryInfo? countryInfo;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? todayRecovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  int? deathsPerOneMillion;
  int? tests;
  int? testsPerOneMillion;
  int? population;
  String? continent;
  int? oneCasePerPeople;
  int? oneDeathPerPeople;
  int? oneTestPerPeople;
  double? activePerOneMillion;
  double? recoveredPerOneMillion;
  int? criticalPerOneMillion;

  Country({
    this.updated,
    this.country,
    this.countryInfo,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.population,
    this.continent,
    this.oneCasePerPeople,
    this.oneDeathPerPeople,
    this.oneTestPerPeople,
    this.activePerOneMillion,
    this.recoveredPerOneMillion,
    this.criticalPerOneMillion,
  });

  Country.fromJson(Map<String, dynamic> json) {
    updated = (json['updated'] as num?)?.toInt();
    country = json['country'];
    countryInfo = json['countryInfo'] != null
        ? CountryInfo.fromJson(json['countryInfo'])
        : null;
    cases = (json['cases'] as num?)?.toInt();
    todayCases = (json['todayCases'] as num?)?.toInt();
    deaths = (json['deaths'] as num?)?.toInt();
    todayDeaths = (json['todayDeaths'] as num?)?.toInt();
    recovered = (json['recovered'] as num?)?.toInt();
    todayRecovered = (json['todayRecovered'] as num?)?.toInt();
    active = (json['active'] as num?)?.toInt();
    critical = (json['critical'] as num?)?.toInt();
    casesPerOneMillion = (json['casesPerOneMillion'] as num?)?.toInt();
    deathsPerOneMillion = (json['deathsPerOneMillion'] as num?)?.toInt();
    tests = (json['tests'] as num?)?.toInt();
    testsPerOneMillion = (json['testsPerOneMillion'] as num?)?.toInt();
    population = (json['population'] as num?)?.toInt();
    continent = json['continent'];
    oneCasePerPeople = (json['oneCasePerPeople'] as num?)?.toInt();
    oneDeathPerPeople = (json['oneDeathPerPeople'] as num?)?.toInt();
    oneTestPerPeople = (json['oneTestPerPeople'] as num?)?.toInt();
    activePerOneMillion = (json['activePerOneMillion'] as num?)?.toDouble();
    recoveredPerOneMillion = (json['recoveredPerOneMillion'] as num?)?.toDouble();
    criticalPerOneMillion = (json['criticalPerOneMillion'] as num?)?.toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['updated'] = updated;
    data['country'] = country;
    if (countryInfo != null) {
      data['countryInfo'] = countryInfo!.toJson();
    }
    data['cases'] = cases;
    data['todayCases'] = todayCases;
    data['deaths'] = deaths;
    data['todayDeaths'] = todayDeaths;
    data['recovered'] = recovered;
    data['todayRecovered'] = todayRecovered;
    data['active'] = active;
    data['critical'] = critical;
    data['casesPerOneMillion'] = casesPerOneMillion;
    data['deathsPerOneMillion'] = deathsPerOneMillion;
    data['tests'] = tests;
    data['testsPerOneMillion'] = testsPerOneMillion;
    data['population'] = population;
    data['continent'] = continent;
    data['oneCasePerPeople'] = oneCasePerPeople;
    data['oneDeathPerPeople'] = oneDeathPerPeople;
    data['oneTestPerPeople'] = oneTestPerPeople;
    data['activePerOneMillion'] = activePerOneMillion;
    data['recoveredPerOneMillion'] = recoveredPerOneMillion;
    data['criticalPerOneMillion'] = criticalPerOneMillion;
    return data;
  }
}

class CountryInfo {
  int? iId;
  String? iso2;
  String? iso3;
  double? lat;
  double? long;
  String? flag;

  CountryInfo({this.iId, this.iso2, this.iso3, this.lat, this.long, this.flag});

  CountryInfo.fromJson(Map<String, dynamic> json) {
    iId = (json['_id'] as num?)?.toInt();
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    lat = (json['lat'] as num?)?.toDouble();
    long = (json['long'] as num?)?.toDouble();
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = iId;
    data['iso2'] = iso2;
    data['iso3'] = iso3;
    data['lat'] = lat;
    data['long'] = long;
    data['flag'] = flag;
    return data;
  }
}




