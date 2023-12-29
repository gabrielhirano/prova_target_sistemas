import 'dart:convert';

import 'package:equatable/equatable.dart';

class TextModel extends Equatable {
  final String key;
  final String description;

  const TextModel({
    required this.key,
    required this.description,
  });

  @override
  List<Object?> get props => [key, description];

  TextModel copyWith({
    String? key,
    String? description,
  }) {
    return TextModel(
      key: key ?? this.key,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'description': description,
    };
  }

  factory TextModel.fromMap(Map<String, dynamic> map) {
    return TextModel(
      key: map['key'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TextModel.fromJson(String source) =>
      TextModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
