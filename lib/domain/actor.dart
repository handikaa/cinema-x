import 'package:freezed_annotation/freezed_annotation.dart';

part 'actor.freezed.dart';

@freezed
class Actor with _$Actor {
  const factory Actor({
    required int id,
    required String name,
    String? profilePath,
  }) = _Actor;

  factory Actor.fromJSON(Map<String, dynamic> json) => Actor(
        id: json['id'],
        name: json['name'],
        profilePath: json['profile_path'],
      );
}
