# SpotLyrics
## *A Lyrical Music APP*
Flutter App Using Bloc Structure with MusixMatch's API 
## Demo
![SpotLyrics](https://github.com/iamtheindian/SpotLyrics/blob/master/demogif.gif)
## Getting Started
### Tree Structure of Lib Folder
```
│   main.dart
│
└───src
    │   app.dart
    │
    ├───blocs
    │       music_bloc.dart
    │       music_detail_bloc.dart
    │       music_detail_bloc_provider.dart
    │
    ├───models
    │       item_model.dart
    │       lyrics_model.dart
    │
    ├───resources
    │       music_api_provider.dart
    │       repository.dart
    │
    └───ui
            music_detail.dart
            music_list.dart
```

### To Checkout
#### Clone this Repo and then inside the Repo run this
`flutter create .` 

#### AfterWords you can run as usual
`flutter run -d <deviceId> --no-sound-null-safety`