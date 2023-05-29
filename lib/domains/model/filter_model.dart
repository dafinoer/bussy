import 'package:equatable/equatable.dart';

class FilterModel extends Equatable {
  final String id;
  final String filterName;

  const FilterModel(this.id, this.filterName);

  @override
  List<Object?> get props => [id, filterName];
}
