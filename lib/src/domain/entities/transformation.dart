import 'package:equatable/equatable.dart';

class Transformation extends Equatable {
  final String accountNumber;
  final String moneyAmount;
  final String screenShotPath;
  final int id;

  /// this like message or contract money

  Transformation(
      {required this.id,
      required this.accountNumber,
      required this.moneyAmount,
      required this.screenShotPath});

  @override
  List<Object?> get props {
    return [
      id,
      accountNumber,
      moneyAmount,
      screenShotPath,
    ];
  }
}
