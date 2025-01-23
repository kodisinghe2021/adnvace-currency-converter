import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CurrencyFlag extends Equatable {
  final String code;
  final String name;
  final String country;
  final String countryCode;
  final String flag;
  CurrencyFlag({
    required this.code,
    required this.name,
    required this.country,
    required this.countryCode,
    required this.flag,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'name': name,
      'country': country,
      'countryCode': countryCode,
      'flag': flag,
    };
  }

  factory CurrencyFlag.fromMap(Map<String, dynamic> map) {
    return CurrencyFlag(
      code: map['code'] != null ? map['code'] as String : "",
      name: map['name'] != null ? map['name'] as String : "",
      country: map['country'] != null ? map['country'] as String : "",
      countryCode:
          map['countryCode'] != null ? map['countryCode'] as String : "",
      flag: map['flag'] != null ? map['flag'] as String : "",
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrencyFlag.fromJson(String source) =>
      CurrencyFlag.fromMap(json.decode(source) as Map<String, dynamic>);

  factory CurrencyFlag.empty()=> CurrencyFlag(code: "",country: "",countryCode: "",flag: "",name: "");

  @override
  // TODO: implement props
  List<Object?> get props => [
        code,
        name,
        country,
        countryCode,
        flag,
      ];
}
