import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  final String? name;
  final String? country;
  final String? value;
  final String? flagImg;

  Currency({
    required this.name,
    required this.country,
    required this.value,
    required this.flagImg,
  });

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      name,
      country,
      value,
      flagImg,
    ];
  }
}
