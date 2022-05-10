import 'package:book_reader/model/category_feed.dart';
import 'package:book_reader/utils/remote_connect.dart';
import 'package:flutter/widgets.dart';

class DetailProvider extends ChangeNotifier {
  CategoryFeed categoryFeed = CategoryFeed();
  var isLoading = true;
  ApiConnect api = ApiConnect();

  void getMoreAuthor(String url) async {
    setLoading(true);
    try {
      setCategoryFeed(await api.getCategoryByUrl(url));
      setLoading(false);
    } catch (e) {
      rethrow;
    }
  }

  setCategoryFeed(CategoryFeed value) {
    categoryFeed = value;
    notifyListeners();
  }

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
