// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'hive_currency_model.g.dart';

@HiveType(typeId: 1)
class HiveCurrencyModel extends Equatable {

  @HiveField(0, defaultValue: "")
  final String code;
  @HiveField(1, defaultValue: "")
  final String name;
  @HiveField(2, defaultValue: "")
  final String country;
  @HiveField(3, defaultValue: "")
  final String countryCode;
  @HiveField(4, defaultValue: "")
  final String flag;
  @HiveField(5, defaultValue: 0.0)
  final double rateOnBase;
  HiveCurrencyModel({
    required this.code,
    required this.name,
    required this.country,
    required this.countryCode,
    required this.flag,
    required this.rateOnBase,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    code,
    name,
    country,
    countryCode,
    flag,
    rateOnBase,
  ];

  @override
  bool get stringify => true;

  HiveCurrencyModel copyWith({
    String? code,
    String? name,
    String? country,
    String? countryCode,
    String? flag,
    double? rateOnBase,
  }) {
    return HiveCurrencyModel(
      code: code ?? this.code,
      name: name ?? this.name,
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      flag: flag ?? this.flag,
      rateOnBase: rateOnBase ?? this.rateOnBase,
    );
  }
}
