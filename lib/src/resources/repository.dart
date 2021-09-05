import 'dart:async';
import 'package:spotlyrics/src/models/lyrics_model.dart';
import 'music_api_provider.dart';
import '../models/item_model.dart';

class Repository {
  final moviesApiProvider = MusicApiProvider();
  Future<ItemModel> fetchAllMusic() => moviesApiProvider.fetchMusicList();
  Future<LyricsModel> fetchLyrics(int trackId) =>
      moviesApiProvider.fetchLyrics(trackId);
}
