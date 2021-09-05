import 'dart:async';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import '../blocs/music_detail_bloc_provider.dart';
import '../models/lyrics_model.dart';
import '../models/item_model.dart';

class MusicDetail extends StatefulWidget {
  const MusicDetail({Key? key, required this.track}) : super(key: key);
  final Track track;

  @override
  MusicDetailState createState() => MusicDetailState();
}

class MusicDetailState extends State<MusicDetail> {
  @override
  void didChangeDependencies() {
    bloc = MusicDetailBlocProvider.of(context);
    bloc.fetchLyricsById(widget.track.trackId);
    print("Lyrics Method Recreadet in MusicDetail");
    super.didChangeDependencies();
  }

  late MusicDetailBloc bloc;
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConnectivityWidgetWrapper(
        disableInteraction: true,
        child: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: Text("SpotLyrics"),
                  expandedHeight: 150,
                  floating: false,
                  elevation: 0.0,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnRNmiQIhyLtx3v5dpNFZRXUYBE6Z8ZWAeGg&usqp=CAU",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ];
            },
            body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.0),
                      Text(
                        widget.track.trackName,
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        "Album: ${widget.track.albumName}",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        "Artist: ${widget.track.artistName}",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rating: " + widget.track.trackRating.toString(),
                            style: TextStyle(fontSize: 15.0),
                          ),
                          Text(
                            "LastUpdated: ${widget.track.updatedTime.month} ${widget.track.updatedTime.year}",
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ],
                      ),
                      Container(
                        height: 30,
                        width: double.infinity,
                        color: Colors.blueGrey,
                        child: Center(
                          child: Text(
                            "Lyrics",
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        child: Center(
                          child: widget.track.hasLyrics == 0
                              ? Text(
                                  "No Lyrics Available",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : StreamBuilder(
                                  stream: bloc.trackLyrics,
                                  builder: (context,
                                      AsyncSnapshot<Future<LyricsModel>>
                                          snapshot) {
                                    if (snapshot.hasData) {
                                      return FutureBuilder(
                                          future: snapshot.data,
                                          builder: (context,
                                              AsyncSnapshot<LyricsModel>
                                                  itemSnapShot) {
                                            if (itemSnapShot.hasData) {
                                              String text =
                                                  itemSnapShot.data!.lyricsBody;
                                              return Text(
                                                text.substring(
                                                    0, text.length - 70),
                                                style: TextStyle(
                                                  fontSize: 25.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              );
                                            }
                                            return CircularProgressIndicator();
                                          });
                                    }
                                    return CircularProgressIndicator();
                                  },
                                ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
