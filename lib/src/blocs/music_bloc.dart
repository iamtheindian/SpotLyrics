import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';

class MusicBloc {
  final _repository = Repository();
  final _musicFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allMusic => _musicFetcher.stream;

  Future<void> fetchAllMusic() async {
    ItemModel itemModel = await _repository.fetchAllMusic();
    _musicFetcher.sink.add(itemModel);
  }

  dispose() {
    _musicFetcher.close();
  }
}

final bloc = MusicBloc();
