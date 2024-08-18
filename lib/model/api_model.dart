import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String stream;
  List<Datum> data;

  Welcome({
    required this.stream,
    required this.data,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        stream: json["stream"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "stream": stream,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  T t;
  String s;
  String datumP;
  String p;
  String c;
  String o;
  String h;
  String l;
  String b;
  String a;
  String cu;
  String au;
  String bu;

  Datum({
    required this.t,
    required this.s,
    required this.datumP,
    required this.p,
    required this.c,
    required this.o,
    required this.h,
    required this.l,
    required this.b,
    required this.a,
    required this.cu,
    required this.au,
    required this.bu,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        t: tValues.map[json["T"]]!,
        s: json["s"],
        datumP: json["p"],
        p: json["P"],
        c: json["c"],
        o: json["o"],
        h: json["h"],
        l: json["l"],
        b: json["b"],
        a: json["a"],
        cu: json["cu"],
        au: json["au"],
        bu: json["bu"],
      );

  Map<String, dynamic> toJson() => {
        "T": tValues.reverse[t],
        "s": s,
        "p": datumP,
        "P": p,
        "c": c,
        "o": o,
        "h": h,
        "l": l,
        "b": b,
        "a": a,
        "cu": cu,
        "au": au,
        "bu": bu,
      };
}

enum T { FP_TCKR }

final tValues = EnumValues({"fpTckr": T.FP_TCKR});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
