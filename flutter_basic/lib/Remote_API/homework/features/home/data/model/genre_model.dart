// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_basic/Remote_API/homework/features/home/domain/entities/genre.dart';

class GenreModel extends Genre {
  @override
  final int id;
  @override
  final String name;
  GenreModel(
    this.id,
    this.name,
  ) : super(id: id, name: name);

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      json['id'] as int,
      json['name'] as String,
    );
  }
}
