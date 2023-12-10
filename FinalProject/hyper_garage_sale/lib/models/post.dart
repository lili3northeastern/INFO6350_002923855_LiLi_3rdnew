import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 0)
class Post extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final List<String> imageUrls;

  Post({
    required this.title,
    required this.description,
    required this.imageUrls,
  }) {
  print('Title: $title, Description: $description, ImageUrls: $imageUrls');
}

  // 添加以下两个方法以支持 JSON 序列化/反序列化
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
