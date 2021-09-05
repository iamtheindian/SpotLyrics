import 'dart:async';
import 'dart:math';
import 'package:http/http.dart' show Client;
import 'package:spotlyrics/src/models/lyrics_model.dart';
import 'dart:convert';
import '../models/item_model.dart';

class MusicApiProvider {
  Client client = Client();
  final _apiKey = ''; //Provide MUSIXMATCH API 
  final _baseUrl = 'https://api.musixmatch.com/ws/1.1';
  Future<ItemModel> fetchMusicList() async {
    var _randomPageNo = Random().nextInt(5) + 1;
    print("Fetching Music List for Page No: $_randomPageNo");
    final response = await client.get(
        "$_baseUrl/chart.tracks.get?apikey=$_apiKey&country=in&page=$_randomPageNo&page_size=20",
        headers: {"Access-Control-Allow-Origin": "*"});
    print(response.body.toString());
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body)["message"]["body"]);
    } else {
      throw Exception('Failed to load Musics');
    }
  }

  Future<LyricsModel> fetchLyrics(int trackId) async {
    print("Fetching lyrics for $trackId");
    final response = await client
        .get("$_baseUrl/track.lyrics.get?apikey=$_apiKey&track_id=$trackId");
    print(response.body.toString());
    if (response.statusCode == 200) {
      return LyricsModel.fromJson(
          json.decode(response.body)["message"]["body"]["lyrics"]);
    } else {
      throw Exception('Failed to load Lyrics');
    }
  }
}
