class CountryModel {
  CountryModel({
    this.name,
    this.tld,
    this.cca2,
    this.ccn3,
    this.cca3,
    this.independent,
    this.status,
    this.unMember,
    // this.currencies,
    // this.idd,
    // this.capital,
    // this.altSpellings,
    // this.region,
    // this.languages,
    // this.translations,
    // this.latlng,
    // this.landlocked,
    // this.area,
    // this.demonyms,
    // this.flag,
    // this.maps,
    // this.population,
    // this.car,
    // this.timezones,
    // this.continents,
    // this.flags,
    // this.coatOfArms,
    // this.startOfWeek,
    // this.capitalInfo,
    // this.cioc,
    // this.subregion,
    // this.fifa,
    // this.borders,
    // this.gini,
    // this.postalCode,
  });

  final Name? name;
  final List<String>? tld;
  final String? cca2;
  final String? ccn3;
  final String? cca3;
  final bool? independent;
  final String? status;
  final bool? unMember;
  // final Map<String, Currency>? currencies;
  // final Idd? idd;
  // final List<String>? capital;
  // final List<String>? altSpellings;
  // final String? region;
  // final Map<String, String>? languages;
  // final Map<String, Translation>? translations;
  // final List<double>? latlng;
  // final bool? landlocked;
  // final double? area;
  // final Demonyms? demonyms;
  // final String? flag;
  // final Maps? maps;
  // final int? population;
  // final Car? car;
  // final List<String>? timezones;
  // final List<String>? continents;
  // final Flags? flags;
  // final CoatOfArms? coatOfArms;
  // final String? startOfWeek;
  // final CapitalInfo? capitalInfo;
  // final String? cioc;
  // final String? subregion;
  // final String? fifa;
  // final List<String>? borders;
  // final Map<String, double>? gini;
  // final PostalCode? postalCode;

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    CountryModel countries = CountryModel(
      name: json["name"] == null ? null : Name.fromJson(json["name"]),
      tld: json["tld"] == null
          ? []
          : List<String>.from(json["tld"]?.map((x) => x)),
      cca2: json["cca2"],
      ccn3: json["ccn3"],
      cca3: json["cca3"],
      independent: json["independent"],
      status: json["status"],
      unMember: json["unMember"],
      // currencies: json["currencies"] == null
      //     ? {}
      //     : Map.from(json["currencies"]).map(
      //         (k, v) => MapEntry<String, Currency>(k, Currency.fromJson(v)),
      //       ),
      // idd: json["idd"] == null ? null : Idd.fromJson(json["idd"]),
      // capital: json["capital"] == null
      //     ? []
      //     : List<String>.from(json["capital"]!.map((x) => x)),
      // altSpellings: json["altSpellings"] == null
      //     ? []
      //     : List<String>.from(json["altSpellings"]!.map((x) => x)),
      // region: json["region"],
      // languages: Map.from(json["languages"])
      //     .map((k, v) => MapEntry<String, String>(k, v)),
      // translations: Map.from(json["translations"]).map(
      //     (k, v) => MapEntry<String, Translation>(k, Translation.fromJson(v))),
      // latlng: json["latlng"] == null
      //     ? []
      //     : List<double>.from(json["latlng"]!.map((x) => x)),
      // landlocked: json["landlocked"],
      // area: json["area"],
      // demonyms:
      //     json["demonyms"] == null ? null : Demonyms.fromJson(json["demonyms"]),
      // flag: json["flag"],
      // maps: json["maps"] == null ? null : Maps.fromJson(json["maps"]),
      // population: json["population"],
      // car: json["car"] == null ? null : Car.fromJson(json["car"]),
      // timezones: json["timezones"] == null
      //     ? []
      //     : List<String>.from(json["timezones"]!.map((x) => x)),
      // continents: json["continents"] == null
      //     ? []
      //     : List<String>.from(json["continents"]!.map((x) => x)),
      // flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
      // coatOfArms: json["coatOfArms"] == null
      //     ? null
      //     : CoatOfArms.fromJson(json["coatOfArms"]),
      // startOfWeek: json["startOfWeek"],
      // capitalInfo: json["capitalInfo"] == null
      //     ? null
      //     : CapitalInfo.fromJson(json["capitalInfo"]),
      // cioc: json["cioc"],
      // subregion: json["subregion"],
      // fifa: json["fifa"],
      // borders: json["borders"] == null
      //     ? []
      //     : List<String>.from(json["borders"]!.map((x) => x)),
      // gini:
      //     Map.from(json["gini"]).map((k, v) => MapEntry<String, double>(k, v)),
      // postalCode: json["postalCode"] == null
      //     ? null
      //     : PostalCode.fromJson(json["postalCode"]),
    );

    return countries;
  }

// Not in use yet
  // @override
  // String toString() {
  //   return "$name, $tld, $cca2, $ccn3, $cca3, $independent, $status, $unMember, $currencies, $idd, $capital, $altSpellings, $region, $languages, $translations, $latlng, $landlocked, $area, $demonyms, $flag, $maps, $population, $car, $timezones, $continents, $flags, $coatOfArms, $startOfWeek, $capitalInfo, $cioc, $subregion, $fifa, $borders, $gini, $postalCode, ";
  // }
}

class CapitalInfo {
  CapitalInfo({
    this.latlng,
  });

  final List<double>? latlng;

  factory CapitalInfo.fromJson(Map<String, dynamic> json) {
    return CapitalInfo(
      latlng: json["latlng"] == null
          ? []
          : List<double>.from(json["latlng"]!.map((x) => x)),
    );
  }

  @override
  String toString() {
    return "$latlng, ";
  }
}

class Car {
  Car({
    this.signs,
    this.side,
  });

  final List<String>? signs;
  final String? side;

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      signs: json["signs"] == null
          ? []
          : List<String>.from(json["signs"]!.map((x) => x)),
      side: json["side"],
    );
  }

  @override
  String toString() {
    return "$signs, $side, ";
  }
}

class CoatOfArms {
  CoatOfArms({
    this.png,
    this.svg,
  });

  final String? png;
  final String? svg;

  factory CoatOfArms.fromJson(Map<String, dynamic> json) {
    return CoatOfArms(
      png: json["png"],
      svg: json["svg"],
    );
  }

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
      };

  @override
  String toString() {
    return "$png, $svg, ";
  }
}

class Currency {
  Currency({
    this.name,
    this.symbol,
  });

  final String? name;
  final String? symbol;

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      name: json["name"],
      symbol: json["symbol"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
      };

  @override
  String toString() {
    return "$name, $symbol, ";
  }
}

class Demonyms {
  Demonyms({
    this.eng,
    this.fra,
  });

  final Eng? eng;
  final Eng? fra;

  factory Demonyms.fromJson(Map<String, dynamic> json) {
    return Demonyms(
      eng: json["eng"] == null ? null : Eng.fromJson(json["eng"]),
      fra: json["fra"] == null ? null : Eng.fromJson(json["fra"]),
    );
  }

  @override
  String toString() {
    return "$eng, $fra, ";
  }
}

class Eng {
  Eng({
    this.f,
    this.m,
  });

  final String? f;
  final String? m;

  factory Eng.fromJson(Map<String, dynamic> json) {
    return Eng(
      f: json["f"],
      m: json["m"],
    );
  }

  @override
  String toString() {
    return "$f, $m, ";
  }
}

class Flags {
  Flags({
    this.png,
    this.svg,
    this.alt,
  });

  final String? png;
  final String? svg;
  final String? alt;

  factory Flags.fromJson(Map<String, dynamic> json) {
    return Flags(
      png: json["png"],
      svg: json["svg"],
      alt: json["alt"],
    );
  }

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
        "alt": alt,
      };

  @override
  String toString() {
    return "$png, $svg, $alt, ";
  }
}

class Idd {
  Idd({
    this.root,
    this.suffixes,
  });

  final String? root;
  final List<String>? suffixes;

  factory Idd.fromJson(Map<String, dynamic> json) {
    return Idd(
      root: json["root"],
      suffixes: json["suffixes"] == null
          ? []
          : List<String>.from(json["suffixes"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "root": root,
        "suffixes": suffixes!.map((x) => x).toList(),
      };
}

class Maps {
  Maps({
    this.googleMaps,
    this.openStreetMaps,
  });

  final String? googleMaps;
  final String? openStreetMaps;

  factory Maps.fromJson(Map<String, dynamic> json) {
    return Maps(
      googleMaps: json["googleMaps"],
      openStreetMaps: json["openStreetMaps"],
    );
  }
}

class Name {
  Name({
    this.common,
    this.official,
    this.nativeName,
  });

  final String? common;
  final String? official;
  final Map<String, Translation>? nativeName;

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      common: json["common"] ?? '',
      official: json["official"] ?? '',
      nativeName: (json["nativeName"] != null && json["nativeName"] is Map)
          ? Map.from(json["nativeName"]).map(
              (k, v) =>
                  MapEntry<String, Translation>(k, Translation.fromJson(v)),
            )
          : {},
    );
  }
}

class Translation {
  Translation({
    this.official,
    this.common,
  });

  final String? official;
  final String? common;

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      official: json["official"] ?? '',
      common: json["common"] ?? '',
    );
  }

  @override
  String toString() {
    return "$official, $common, ";
  }
}

class PostalCode {
  PostalCode({
    this.format,
    this.regex,
  });

  final String? format;
  final String? regex;

  factory PostalCode.fromJson(Map<String, dynamic> json) {
    return PostalCode(
      format: json["format"],
      regex: json["regex"],
    );
  }

  Map<String, dynamic> toJson() => {
        "format": format,
        "regex": regex,
      };
}
