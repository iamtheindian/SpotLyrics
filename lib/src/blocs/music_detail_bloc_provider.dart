import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'music_detail_bloc.dart';
export 'music_detail_bloc.dart';

class MusicDetailBlocProvider extends InheritedWidget {
  final MusicDetailBloc bloc;

  MusicDetailBlocProvider({Key? key, required Widget child})
      : bloc = MusicDetailBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static MusicDetailBloc of(BuildContext context) {
    return (context
                .dependOnInheritedWidgetOfExactType<MusicDetailBlocProvider>()
            as MusicDetailBlocProvider)
        .bloc;
  }
}
