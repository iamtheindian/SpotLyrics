class LyricsModel {
  LyricsModel({
    required this.lyricsId,
    required this.lyricsBody,
    required this.updatedTime,
  });

  final int lyricsId;
  final String lyricsBody;
  final DateTime updatedTime;

  factory LyricsModel.fromJson(Map<String, dynamic> json) => LyricsModel(
        lyricsId: json["lyrics_id"],
        lyricsBody: json["lyrics_body"],
        updatedTime: DateTime.parse(json["updated_time"]),
      );

  Map<String, dynamic> toJson() => {
        "lyrics_id": lyricsId,
        "lyrics_body": lyricsBody,
        "updated_time": updatedTime.toIso8601String(),
      };
}
