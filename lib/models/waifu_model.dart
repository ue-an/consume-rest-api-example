import 'dart:convert';

class SingleWaifu {
  String url;
  SingleWaifu({
    required this.url,
  });

  factory SingleWaifu.fromJson(Map<String, dynamic> json) => SingleWaifu(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class ManyWaifus {
  List files;
  ManyWaifus({
    required this.files,
  });

  factory ManyWaifus.fromJson(Map<String, dynamic> json) => ManyWaifus(
        files: json["files"],
      );

  Map<String, dynamic> toJson() => {
        "files": files,
      };
}
