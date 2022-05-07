import 'package:book_reader/model/CategoryFeed.dart';
import 'package:book_reader/utils/api_status.dart';
import 'package:book_reader/utils/check_connect.dart';
import 'package:book_reader/utils/remote_connect.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  CategoryFeed topNews = CategoryFeed();
  CategoryFeed recentNews = CategoryFeed();
  ApiConnect apiConnect = ApiConnect();
  ApiStatus apiStatus = ApiStatus.loading;

  getRemoteNews() async {
    setApiStatus(ApiStatus.loading);
    try {
      setTopNews(await apiConnect.getCategoryByUrl(ApiConnect.popular));
      setRecentNews(await apiConnect.getCategoryByUrl(ApiConnect.recent));
      setApiStatus(ApiStatus.loaded);
    } catch (e) {
      checkError(e);
    }
  }

  void checkError(e) {
    if (CheckConnect.checkConnection(e)) {
      setApiStatus(ApiStatus.connectError);
    } else {
      setApiStatus(ApiStatus.error);
    }
  }

  setApiStatus(ApiStatus status) {
    apiStatus = status;
    notifyListeners();
  }

  setTopNews(value) {
    topNews = value;
    notifyListeners();
  }

  setRecentNews(value) {
    recentNews = value;
    notifyListeners();
  }
}
