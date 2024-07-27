import 'package:flutter/material.dart';

class WidgetsProvider with ChangeNotifier {
  bool _textWidgetSelector = false;
  bool _imageWidgetSelector = false;
  bool _buttonWidgetSelector = false;

  bool getTextWidgetSelector() => _textWidgetSelector;
  bool getImageWidgetSelector() => _imageWidgetSelector;
  bool getButtonWidgetSelector() => _buttonWidgetSelector;

  void setTextWidgetSelector(bool value) {
    _textWidgetSelector = (value) ? true : false;
    notifyListeners();
  }

  void setImageWidgetSelector(bool value) {
    _imageWidgetSelector = (value) ? true : false;
    notifyListeners();
  }

  void setButtonWidgetSelector(bool value) {
    _buttonWidgetSelector = (value) ? true : false;
    notifyListeners();
  }
}
