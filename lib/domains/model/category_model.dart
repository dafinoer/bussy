import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String alias;
  final String title;

  const CategoryModel({
    required this.title,
    required this.alias,
  });

  @override
  List<Object?> get props => [alias, title];
}
