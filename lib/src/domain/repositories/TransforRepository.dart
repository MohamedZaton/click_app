import 'package:click_app/src/core/error/failure.dart';
import 'package:click_app/src/domain/entities/transformation.dart';
import 'package:dartz/dartz.dart';

abstract class TransformRepository {
  Future<Either<Failure, Transformation>> getTransformHistory();
}
