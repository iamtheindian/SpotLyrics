import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/music_bloc.dart';
import '../blocs/music_detail_bloc_provider.dart';
import 'music_detail.dart';

class MusicList extends StatefulWidget {
  @override
  _MusicListState createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  @override
  void initState() {
    bloc.fetchAllMusic();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SpotLyrics"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: bloc.fetchAllMusic,
            icon: Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: ConnectivityWidgetWrapper(
        disableInteraction: true,
        child: StreamBuilder(
          stream: bloc.allMusic,
          builder: (context, AsyncSnapshot<ItemModel> snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              return buildList(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget buildList(ItemModel data) {
    return ListView.builder(
      itemCount: data.trackList.length,
      itemBuilder: (BuildContext context, int index) {
        Track curr = data.trackList[index].track;
        return ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 21,
              child: Text(curr.trackName[0]),
            ),
          ),
          title: Text(curr.trackName),
          subtitle: Text(curr.artistName),
          onTap: () => openDetailPage(curr),
        );
      },
    );
  }

  openDetailPage(Track data) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return MusicDetailBlocProvider(
          child: MusicDetail(
            track: data,
          ),
        );
      }),
    );
  }
}
