import 'package:equatable/equatable.dart';

class FeedModel extends Equatable{
  final String? title;
  final List<Feed>? feeds;

  const FeedModel({
    this.title,
    this.feeds,
  });

  factory FeedModel.fromJson(Map<String, dynamic> json) => FeedModel(
    title: json["title"],
    feeds: json["rows"] == null ? [] : List<Feed>.from(json["rows"].map((x) => Feed.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "rows": feeds == null ? [] : List<dynamic>.from(feeds!.map((x) => x.toJson())),
  };

  @override
  // TODO: implement props
  List<Object?> get props => [title, feeds];
}

class Feed extends Equatable{
  final String title;
  final String description;
  final String imageHref;

  const Feed({
    required this.title,
    required this.description,
    required this.imageHref,
  });

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
    title: json["title"] ?? '',
    description: json["description"] ?? '',
    imageHref: json["imageHref"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "imageHref": imageHref,
  };

  @override
  // TODO: implement props
  List<Object?> get props => [title, description, imageHref];
}