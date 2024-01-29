import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:news_app/domain/repo/news_repo.dart';

import '../../domain/models/news_model.dart';
import '../../domain/repo/error_handling.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepo _newsRepo = NewsRepo();
  NewsBloc() : super(NewsInitialState()) {
    on<GetNewsEvent>((event, emit) async {
      // TODO: implement event handler
      emit(NewsLoadingState());
      await _newsRepo.getNews().then((value) {
        var articlesData = NewsModel.fromJson(value.data);

        emit(NewsSuccessState(articles: articlesData.articles));
      }).onError((error, stackTrace) {
        if (error is DioException) {
          final exception = ApiException();
          exception.errors = exception.getExceptionMessage(error);
          emit(NewsErrorState(errors: exception.errors));
        } else {
          emit(NewsErrorState(errors: [error.toString()]));
        }
      });
    });
  }
}
