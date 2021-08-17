import 'package:dio/dio.dart';
import 'package:flutter_app_advanced_newsapp/models/SourceResponse.dart';
import 'package:flutter_app_advanced_newsapp/models/article_response.dart';

class NewsRepository{
  static String mainUrl = "https://newsapi.org/v2/";
  final String apiKey="e3131b5de9b84bde84a033a741f00817";

  final Dio _dio = Dio();

  var getSourcesUrl = "$mainUrl/sources";
  var getTopHeadLinesUrl = "$mainUrl/top-headlines";
  var everythingUrl = "$mainUrl/everything";

  Future<SourceResponse> getSources() async{
    var params={
      "apiKey": apiKey,
      "language": "en",
      "country": "us",
    };
    try{
      Response response = await _dio.get(getSourcesUrl,queryParameters: params);
      return SourceResponse.fromJson(response.data);
    }
    catch(error,stacktrace){
     print("Exception occured: $error stackTrace: $stacktrace");
      return SourceResponse.withError(error);
    }
  }
  Future<ArticleResponse> getTopHeadlines() async{
      var params={
        "apiKey": apiKey,
        "country": "us"
      };

      try {
        Response response = await _dio.get(
            getTopHeadLinesUrl, queryParameters: params);
        return ArticleResponse.fromJson(response.data);
      }
      catch(error,stacktrace){
         return ArticleResponse.withError(error);
      }
  }
  Future<ArticleResponse> getHotNews() async{
    var params={
      "apiKey": apiKey,
      "q": "apple",
      "sortBy": "popularity"
    };

    try {
      Response response = await _dio.get(
          everythingUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    }
    catch(error,stacktrace){
      return ArticleResponse.withError(error);
    }
  }
  Future<ArticleResponse> getSourceNews(String sourceId) async{
    var params={
      "apiKey": apiKey,
      "sources": sourceId
    };

    try {
      Response response = await _dio.get(
          getTopHeadLinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    }
    catch(error,stacktrace){
      return ArticleResponse.withError(error);
    }
  }
  Future<ArticleResponse> search(String searchValue) async{
    var params={
      "apiKey": apiKey,
      "q":searchValue,

    };

    try {
      Response response = await _dio.get(
          getTopHeadLinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    }
    catch(error,stacktrace){
      return ArticleResponse.withError(error);
    }
  }

}