import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'todo_data.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo with EquatableMixin {
  ///
  const Todo({
    this.success,
    this.message,
    this.data,
  });

  ///
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  ///

  final bool? success;
  final String? message;
  final TodoData? data;

  Map<String, dynamic> toJson() => _$TodoToJson(this);

  @override
  List<Object?> get props => [success, message, data];
}
