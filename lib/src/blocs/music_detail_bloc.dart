import 'dart:async';

import 'package:rxdart/rxdart.dart';
import '../models/lyrics_model.dart';
import '../resources/repository.dart';

class MusicDetailBloc {
  final _repository = Repository();
  final _trackId = PublishSubject<int>();
  final _lyrics = BehaviorSubject<Future<LyricsModel>>();

  Function(int) get fetchLyricsById => _trackId.sink.add;

  Observable<Future<LyricsModel>> get trackLyrics => _lyrics.stream;

  MusicDetailBloc() {
    _trackId.stream.transform(_itemTransformer()).pipe(_lyrics);
  }
  dispose() async {
    _trackId.close();
    await _lyrics.drain();
    _lyrics.close();
  }

  _itemTransformer() {
    return ScanStreamTransformer(
      (Future<LyricsModel> lyrics, int trackId, int index) {
        print(trackId);
        print(index);
        lyrics = _repository.fetchLyrics(trackId);
        return lyrics;
      },
    );
  }
}
