import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:my_news_provider/models/news_model.dart';

class NewsData with ChangeNotifier {
  List<NewsModel> newslist = [];
  Map<String, dynamic> _map = {};
  bool _error = false;
  String _errorMessage = '';

  Map<String, dynamic> get map => _map;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> get fetchData async {
    final response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=id&apiKey=d1f577d3cda04dac810825973d358f04'));

    if (response.statusCode == 200) {
      try {
        _map = jsonDecode(response.body);
        _error = false;
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _map = {};
      }
    } else {
      _error = true;
      _errorMessage = 'Error = Check Your Internet Connection';
      _map = {};
    }
    notifyListeners();
  }

  void initialValues() {
    _map = {};
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }
}
