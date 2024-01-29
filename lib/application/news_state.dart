// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsErrorState extends NewsState {
  final List<String> errors;
  NewsErrorState({required this.errors});
}

class NewsLoadingState extends NewsState {}

class NewsSuccessState extends NewsState {
  final List<Article> articles;
  NewsSuccessState({
    required this.articles,
  });
}
