import 'package:flutter/material.dart';

class FirebaseProvider with ChangeNotifier {
  String _savedText = '';
  String _savedImageUrl = '';

  void setSavedText(String text) {
    _savedText = text;
    notifyListeners();
  }

  String getSavedText() => _savedText;

  void setSavedImageUrl(String url) {
    _savedImageUrl = url;
    notifyListeners();
  }

  String getSavedUrl() => _savedImageUrl;
}
