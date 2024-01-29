import 'package:dio/dio.dart';

class NewsRepo {
  final Dio _dio = Dio();
  Future<Response> getNews() {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=904dfa4ec028402eb96af378002fa65c";
    var res = _dio.get(url);
    return res;
  }
}
