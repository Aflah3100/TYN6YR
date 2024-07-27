import 'dart:io';
import 'package:flutter/material.dart';

class ImagesProvider with ChangeNotifier {
  File? _imageFile;
  String _savedImageUrl = '';
  

  void setImageFile(File imageFile) {
    _imageFile = imageFile;
    notifyListeners();
  }

  File? getImageFile() => _imageFile;

  void clearImageFile() {
    _imageFile = null;
    notifyListeners();
  }

  void setSavedImageUrl(String url) {
    _savedImageUrl = url;
    notifyListeners();
  }

  String getSavedImageUrl() => _savedImageUrl;
}
