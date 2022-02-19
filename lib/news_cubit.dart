import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/Screen/articals.dart';
import 'package:newsapp/Screen/setting.dart';
import 'package:newsapp/Screen/since.dart';
import 'package:newsapp/Screen/sport.dart';
import 'package:newsapp/helper/api.dart';
import 'package:newsapp/helper/cachHelper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  List<dynamic> articles = [];
  List<dynamic> sport = [];
  List<dynamic> scince = [];
  bool isDark = false;
  // ignore: non_constant_identifier_names
  List<Widget> Screen = [
    Artical(),
    Sport(),
    Sciences(),
    Setting(),
  ];
  void ChangeNavBar(int index) {
    currentindex = index;
    emit(NewsChangeNavBar());
  }

  void getApiDataBusiness() {
    DioHelper.getData(
      'v2/top-headlines',
      {
        'country': 'eg',
        'category': 'business',
        'apiKey': '78669fb6c90f42b68e4e0314b2b1c051'
      },
    ).then((value) {
      articles = value.data['articles'];
      emit(NewsGetDataApi());
    });
  }

  void getApiDataScince() {
    DioHelper.getData(
      'v2/top-headlines',
      {
        'country': 'eg',
        'category': 'health',
        'apiKey': '78669fb6c90f42b68e4e0314b2b1c051'
      },
    ).then((value) {
      scince = value.data['articles'];
      emit(NewsGetDataScince());
    });
  }

  void getApiDataSports() {
    DioHelper.getData(
      'v2/top-headlines',
      {
        'country': 'eg',
        'category': 'sport',
        'apiKey': '78669fb6c90f42b68e4e0314b2b1c051'
      },
    ).then((value) {
      sport = value.data['articles'];
      emit(NewsGetDataSport());
    });
  }

  void changeTheme({bool charedMode}) {
    if (charedMode != null) {
      isDark = charedMode;
      emit(NewsGetMode());
    } else {
      isDark = !isDark;
      CachHelper.setMode('isDark', isDark).then((value) {
        emit(NewsGetMode());
      });
    }
  }

  List<dynamic> search = [];
  void getApiSearch(String value) {
    DioHelper.getData(
      'v2/everything',
      {
        'q': '$value',
        'apiKey': '78669fb6c90f42b68e4e0314b2b1c051',
      },
    ).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearch());
    });
  }
}
