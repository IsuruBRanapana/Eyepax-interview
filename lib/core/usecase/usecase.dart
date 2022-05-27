import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_eyepax_practical/core/error/failures.dart';

///Created By Isuru B. Ranapana
/// 2022-05-27 22:40

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}