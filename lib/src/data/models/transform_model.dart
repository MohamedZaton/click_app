import 'package:click_app/src/domain/entities/transformation.dart';

class TransformModel extends Transformation {
  TransformModel(
      {required super.id,
      required super.accountNumber,
      required super.moneyAmount,
      required super.screenShotPath});

  /// json  from and to after get request

}
