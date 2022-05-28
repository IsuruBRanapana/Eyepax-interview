import 'package:equatable/equatable.dart';

///Created By Isuru B. Ranapana
/// 2022-05-28 21:23

class CategoryEntity extends Equatable {
  const CategoryEntity({
    required this.name,
    required this.id,
  });

  final String name;
  final int id;

  @override
  List<Object> get props => [name, id];
}
