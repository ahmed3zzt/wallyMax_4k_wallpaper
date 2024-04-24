import 'dart:convert';

class Wallpaper {
  final String id;
  final String slug;
  final int width;
  final int height;
  final String color;
  final String blurHash;
  final String altDescription;
  final Urls urls;

  Wallpaper({
    required this.id,
    required this.slug,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    required this.altDescription,
    required this.urls,
  });
  factory Wallpaper.fromJson(Map<String, dynamic> json) => Wallpaper(
        id: json["id"],
        slug: json["slug"],
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        altDescription: json["alt_description"],
        urls: Urls.fromJson(json["urls"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "alt_description": altDescription,
        "urls": urls.toJson(),
      };
}

class Urls {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;
  final String smallS3;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  factory Urls.fromRawJson(String str) => Urls.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
        smallS3: json["small_s3"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
        "small_s3": smallS3,
      };
}
