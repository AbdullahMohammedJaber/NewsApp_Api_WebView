part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsChangeNavBar extends NewsState {}

class NewsGetDataApi extends NewsState {}

class NewsGetDataSport extends NewsState {}

class NewsGetDataScince extends NewsState {}

class NewsGetMode extends NewsState {}

class NewsGetSearch extends NewsState {}
