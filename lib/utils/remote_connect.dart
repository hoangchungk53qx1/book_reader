import 'dart:convert';

import 'package:book_reader/model/CategoryFeed.dart';
import 'package:dio/dio.dart';
import 'package:xml2json/xml2json.dart';

class ApiConnect {
  Dio dio = Dio();
  static String baseURL = 'https://catalog.feedbooks.com';
  static String publicDomainURL = '$baseURL/publicdomain/browse';
  static String popular = '$publicDomainURL/top.atom';
  static String recent = '$publicDomainURL/recent.atom';

  Future<CategoryFeed> getCategoryByUrl(String url) async {
    var response = await dio.get(url).catchError((error) {
      throw (error);
    });
    CategoryFeed categoryFeed;
    if (response.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(response.data.toString());
      categoryFeed = CategoryFeed.fromJson(jsonDecode(xml2json.toGData()));
    } else {
      throw ('Error Code ${response.statusCode}');
    }
    return categoryFeed;
  }
}
