import 'package:json_annotation/json_annotation.dart';

part 'base_entity.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseEntity<T> {
  int? code;
  String? message;
  T? data;

  BaseEntity({this.code, this.message, this.data});

  factory BaseEntity.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseEntityFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseEntityToJson(this, toJsonT);
}
