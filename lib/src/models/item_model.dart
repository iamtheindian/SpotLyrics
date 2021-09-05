class ItemModel {
  ItemModel({
    required this.trackList,
  });

  final List<TrackList> trackList;

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        trackList: List<TrackList>.from(
            json["track_list"].map((x) => TrackList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "track_list": List<dynamic>.from(trackList.map((x) => x.toJson())),
      };
}

class TrackList {
  TrackList({
    required this.track,
  });

  final Track track;

  factory TrackList.fromJson(Map<String, dynamic> json) => TrackList(
        track: Track.fromJson(json["track"]),
      );

  Map<String, dynamic> toJson() => {
        "track": track.toJson(),
      };
}

class Track {
  Track({
    required this.trackId,
    required this.trackName,
    required this.trackRating,
    required this.commontrackId,
    required this.hasLyrics,
    required this.hasSubtitles,
    required this.numFavourite,
    required this.albumId,
    required this.albumName,
    required this.artistId,
    required this.artistName,
    required this.trackShareUrl,
    required this.trackEditUrl,
    required this.updatedTime,
  });

  final int trackId;
  final String trackName;
  final int trackRating;
  final int commontrackId;
  final int hasLyrics;
  final int hasSubtitles;
  final int numFavourite;
  final int albumId;
  final String albumName;
  final int artistId;
  final String artistName;
  final String trackShareUrl;
  final String trackEditUrl;
  final DateTime updatedTime;

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        trackId: json["track_id"],
        trackName: json["track_name"],
        trackRating: json["track_rating"],
        commontrackId: json["commontrack_id"],
        hasLyrics: json["has_lyrics"],
        hasSubtitles: json["has_subtitles"],
        numFavourite: json["num_favourite"],
        albumId: json["album_id"],
        albumName: json["album_name"],
        artistId: json["artist_id"],
        artistName: json["artist_name"],
        trackShareUrl: json["track_share_url"],
        trackEditUrl: json["track_edit_url"],
        updatedTime: DateTime.parse(json["updated_time"]),
      );

  Map<String, dynamic> toJson() => {
        "track_id": trackId,
        "track_name": trackName,
        "track_rating": trackRating,
        "commontrack_id": commontrackId,
        "has_lyrics": hasLyrics,
        "has_subtitles": hasSubtitles,
        "num_favourite": numFavourite,
        "album_id": albumId,
        "album_name": albumName,
        "artist_id": artistId,
        "artist_name": artistName,
        "track_share_url": trackShareUrl,
        "track_edit_url": trackEditUrl,
        "updated_time": updatedTime.toIso8601String(),
      };
}
