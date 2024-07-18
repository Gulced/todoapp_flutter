import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'todo_data.dart';

part 'todos.g.dart';

@JsonSerializable()
class Todos with EquatableMixin {
  ///
  const Todos({
    this.success,
    this.message,
    this.data,
  });

  ///
  factory Todos.fromJson(Map<String, dynamic> json) => _$TodosFromJson(json);

  ///
  final bool? success;
  final String? message;
  final List<TodoData>? data;

  ///
  Map<String, dynamic> toJson() => _$TodosToJson(this);

  ///
  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}
