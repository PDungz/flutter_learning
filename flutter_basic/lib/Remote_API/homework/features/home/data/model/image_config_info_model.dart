// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_basic/Remote_API/homework/features/home/domain/entities/image_config_info.dart';

class ImageConfigInfoModel extends ImageConfigInfo {
  @override
  final String baseUrl;
  @override
  final List<String> posterSizes;

  ImageConfigInfoModel({
    required this.baseUrl,
    required this.posterSizes,
  }) : super(
          baseUrl: baseUrl,
          posterSizes: posterSizes,
        );

  factory ImageConfigInfoModel.fromJson(Map<String, dynamic> json) =>
      ImageConfigInfoModel(
        baseUrl: json['base_url'] as String,
        posterSizes: (json['poster_sizes'] as List<dynamic>)
            .map(
              (e) => e as String,
            )
            .toList(),
      );
}
